variable "subnet_id" {
  description = "The ID of the subnet where the instance will be deployed"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "ssh_key_name" {
  description = "Optional SSH key name to use for the instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Ec2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_instance" {
  description = "Whether the instance should be public (with an EIP)"
  type        = bool
  default     = false
}

variable "name_prefix" {
  description = "Prefix to use for naming all resources"
  type        = string
}

variable "incoming_ssh_cidr" {
  description = "CIDR block allowed to access the instance via SSH"
  type        = string
}
