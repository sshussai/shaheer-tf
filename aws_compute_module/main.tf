resource "aws_key_pair" "generated" {
  count      = var.ssh_key_name == null ? 1 : 0
  key_name   = "${var.name_prefix}-key"
  public_key = tls_private_key.generated.public_key_openssh
}

resource "tls_private_key" "generated" {
  count     = var.ssh_key_name == null ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_security_group" "instance_sg" {
  name        = "${var.name_prefix}-sg"
  description = "Security group for EC2 instance"
  vpc_id      = data.aws_subnet.selected.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.incoming_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_network_interface" "eni" {
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.instance_sg.id]
  tags = {
    Name = "${var.name_prefix}-eni"
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.ssh_key_name != null ? var.ssh_key_name : aws_key_pair.generated[0].key_name
  network_interface {
    network_interface_id = aws_network_interface.eni.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.name_prefix}-instance"
  }
}

resource "aws_eip" "eip" {
  count = var.public_instance ? 1 : 0
  vpc   = true
  tags = {
    Name = "${var.name_prefix}-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  count                = var.public_instance ? 1 : 0
  allocation_id        = aws_eip.eip[0].id
  network_interface_id = aws_network_interface.eni.id
}