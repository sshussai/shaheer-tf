variable "name_prefix" {
  description = "Prefix to use for naming AWS resources"
  type        = string
}

variable "ownership_controls" {
  description = "Whether bucket ownership control configured for the bucket"
  type        = bool
  default     = false
}

variable "acl" {
  description = "Whether 'private' ACL should be configured for the bucket"
  type        = bool
  default     = false
}

variable "server_side_encryption" {
  description = "Whether server side encryption should be enabled on the bucket contents"
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Whether versioning should be configured for the bucket"
  type        = bool
  default     = false
}

variable "lifecycle_rule" {
  description = "Whether a default lifecycle rule should be configured for the bucket"
  type        = bool
  default     = false
}

