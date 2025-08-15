output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.bucket.id
}

output "ownership_controls" {
  description = "S3 bucket ownership controls if configured"
  # value       = try(aws_s3_bucket_ownership_controls.ownership_controls[0], "S3 bucket ownership controls not available")
  value = var.ownership_controls ? aws_s3_bucket_ownership_controls.ownership_controls[0].rule : [{}]
}

output "bucket_acl" {
  description = "S3 bucket ACL if configured"
  # value       = try(aws_s3_bucket_acl.acl[0], "S3 bucket ACL not available")
  value = var.acl ? aws_s3_bucket_acl.acl[0].acl : "ACL not available"
}

output "bucket_server_side_encryption" {
  description = "S3 bucket Server Side Encryption if configured"
  # value       = try(aws_s3_bucket_server_side_encryption_configuration.server_side_encryption[0], "S3 bucket Server Side Encryption not available")
  value = var.server_side_encryption ? aws_s3_bucket_server_side_encryption_configuration.server_side_encryption[0].rule : {}
}

output "bucket_versioning" {
  description = "S3 bucket versioning if configured"
  # value       = try(aws_s3_bucket_server_side_encryption_configuration.server_side_encryption[0], "S3 bucket versioning not available")
  value = var.versioning ? aws_s3_bucket_versioning.versioning[0].versioning_configuration : []
}

output "bucket_lifecycle_rule" {
  description = "S3 bucket lifecycle rule if configured"
  # value       = try(aws_s3_bucket_lifecycle_configuration.bucket_config[0], "S3 bucket lifecycle rule not available")
  value = var.lifecycle_rule ? (var.versioning ? aws_s3_bucket_lifecycle_configuration.versioning_bucket_config[0].rule : aws_s3_bucket_lifecycle_configuration.bucket_config[0].rule) : []
}
