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
module "sg" {
  source       = "./modules/sg"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  depends_on   = [module.vpc]
}
module "alb" {
  source             = "./modules/alb"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  internal_alb_sg_id = module.sg.internal_alb_sg_id
  external_alb_sg_id = module.sg.external_alb_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
  depends_on         = [module.sg]
}