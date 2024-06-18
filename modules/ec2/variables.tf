variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  default     = "t2.micro"
}
