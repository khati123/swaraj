variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-2"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Terra-Khati"
}

variable "cidr_vpc" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "cidr_subnet1" {
  description = "The CIDR block for the VPC"
  default     = "10.0.1.0/24"
}


variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0cf7b2f456cd5efd4"
}
