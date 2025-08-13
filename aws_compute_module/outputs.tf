
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.ec2.private_ip
}

output "public_ip" {
  description = "The public IP address of the EC2 instance (if applicable)"
  value       = try(aws_eip.eip[0].public_ip, "Public IP not available")

}
