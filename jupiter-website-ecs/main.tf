#configure_aws_provider
provider "aws" {
  region  = "us-east-1"
}

#create_vpc
module "vpc" {
  source                        = "../modules/vpc"
  region                        = var.region
  project_name                  = var.project_name
  vpc_cidr                      = var.vpc_cidr
  public_subnet_az1_cidr        = var.public_subnet_az1_cidr
  public_subnet_az2_cidr        = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr   = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr   = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr  = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr  = var.private_data_subnet_az2_cidr
}

#create_natgateway
module "nat_gateway" {
  source                        = "../modules/nat-gateway"
  public_subnet_az1_id          = module.vpc.public_subnet_az1_id
  public_subnet_az2_id          = module.vpc.public_subnet_az2_id
  internet_gateway              = module.vpc.internet_gateway
  vpc_id                        = module.vpc.vpc_id
  private_app_subnet_az1_id     = module.vpc.private_app_subnet_az1_id
  private_data_subnet_az1_id    = module.vpc.private_data_subnet_az1_id
  private_app_subnet_az2_id     = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az2_id    = module.vpc.private_data_subnet_az2_id
}

#create_security group
module "security_group" {
  source = "../modules/securitygroup"
  vpc_id = module.vpc.vpc_id
  
}