variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "sample"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "var.security_group"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "Nav-ec2-instance"
}

variable "ami_id" {
  description = "AMI for linux Ec2 instance"
  default     = "ami-06489866022e12a14"
}

