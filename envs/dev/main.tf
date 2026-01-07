
provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_name             = "VPC_Practice"
  vpc_cidr             = "10.0.0.0/16"
  private_subnet_name  = "My_PracticeSubnet"
  private_subnet_cidr  = "10.0.0.0/28"
  tags = {
    Environment = "Development"
    Owner       = "Kafil Siddiqui"
    Project     = "Infra Automation"
  }
}

module "security" {
  source  = "../../modules/security"
  sg_name = "TerraSG"
  vpc_id  = module.vpc.vpc_id
  tags = {
    Environment = "Development"
    Owner       = "Kafil Siddiqui"
  }
}

module "ec2" {
  source      = "../../modules/ec2"
  instance_type = "t3.medium"
  key_name      = "Terrakey"
  subnet_id     = module.vpc.private_subnet_id
  sg_id         = module.security.sg_id
  ec2_name      = "TerraformEC2"
  tags = {
    Environment = "Development"
    Owner       = "Kafil Siddiqui"
  }
}
