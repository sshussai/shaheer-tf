
# Terraform EC2 Instance Module

This module creates a basic EC2 Linux instance in AWS with the following features:

- Launches an EC2 instance using a specified AMI ID and subnet ID.
- Optionally uses a provided SSH key name or generates one if not provided.
- Attaches an ENI to the instance.
- Allocates 8GB of EBS storage.
- Optionally makes the instance public by associating an Elastic IP.

## Inputs

- `subnet_id`: The ID of the subnet to launch the instance in (required).
- `ami_id`: The AMI ID to use for the EC2 instance (required).
- `ssh_key_name`: Optional SSH key name to use for the instance.
- `instance_type`: Ec2 instance type
- `public_instance`: Optional boolean to indicate if the instance should be public.
- `name_prefix`: Prefix to use for naming all compute resources
- `incoming_ssh_cidr`: CIDR block allowed to access the instance via SSH

## Outputs

- `instance_id`: The ID of the EC2 instance.
- `private_ip`: The private IP address of the EC2 instance.
- `public_ip`: The public IP address of the EC2 instance (if applicable).
