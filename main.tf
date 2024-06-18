module "aws_vpc" {
  source        = "./modules/vpc"
  region        = "us-east-2"
}
module "aws_ec2" {
  source = "./modules/ec2"
 }

output "vpc_id" {
  value = aws_vpc.main.id
}
