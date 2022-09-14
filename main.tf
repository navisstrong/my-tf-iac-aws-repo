provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "mysecuritygroup" {
  name        = "var.security_group"
  description = "Security group for EC2 instance"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "var.security_group"
  }
}

resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.security_group]

  tags = {
    Name = var.tag_name
  }
}

resource "aws_eip" "myFirstInstance" {
  instance = aws_instance.myFirstInstance.id
  vpc      = true
  tags= {
    Name = "myelasticIP"
  }
}
