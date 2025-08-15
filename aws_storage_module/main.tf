resource "aws_s3_bucket" "bucket" {

  bucket = "${var.name_prefix}-bucket"

  tags = {
    Name        = "${var.name_prefix}-bucket"
    Environment = var.name_prefix
  }

}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  count = var.ownership_controls ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  count = var.acl ? 1 : 0
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls[0]]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption" {
  count = var.server_side_encryption ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  count = var.versioning ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
  count = var.lifecycle_rule ? (var.versioning ? 0 : 1) : 0
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {}

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioning_bucket_config" {
  count = var.lifecycle_rule ? 0 : (var.versioning ? 1 : 0)
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.versioning[0]]

  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "log"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}