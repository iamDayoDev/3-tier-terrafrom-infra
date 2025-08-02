module "vpc" {
  source                = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  azs                   = var.azs
  public_subnets        = var.public_subnets
  private_subnets       = var.private_subnets
  public_subnet_names   = var.public_subnet_names
  private_subnets_names = var.private_subnets_names
}