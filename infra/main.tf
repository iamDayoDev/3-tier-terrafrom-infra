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
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
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
module "app_server" {
  source                   = "./modules/app_server"
  project_name             = var.project_name
  vpc_id                   = module.vpc.vpc_id
  app_tier_sg_id           = module.sg.app_tier_sg_id
  private_subnet_ids       = slice(module.vpc.private_subnet_ids, 0, length(var.azs))
  internal_alb_sg_id       = module.sg.internal_alb_sg_id
  app_instance_type        = var.app_instance_type
  app_asg_min_size         = var.app_asg_min_size
  app_asg_max_size         = var.app_asg_max_size
  app_asg_desired_capacity = var.app_asg_desired_capacity
  app_tg_arn               = module.alb.app_tg_arn
  instance_profile_name    = module.iam.ec2_instance_profile_name
  depends_on               = [module.iam, module.alb, module.sg, module.vpc]
}
module "web_server" {
  source                   = "./modules/web_server"
  project_name             = var.project_name
  vpc_id                   = module.vpc.vpc_id
  web_tier_sg_id           = module.sg.web_tier_sg_id
  public_subnet_ids        = module.vpc.public_subnet_ids
  external_alb_sg_id       = module.sg.external_alb_sg_id
  web_instance_type        = var.web_instance_type
  web_asg_min_size         = var.web_asg_min_size
  web_asg_max_size         = var.web_asg_max_size
  web_asg_desired_capacity = var.web_asg_desired_capacity
  web_tg_arn               = module.alb.web_tg_arn
  instance_profile_name    = module.iam.ec2_instance_profile_name
  depends_on               = [module.app_server]
}
module "database" {
  source               = "./modules/database"
  project_name         = var.project_name
  cluster_identifier   = var.cluster_identifier
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_tier_sg_id        = [module.sg.db_tier_sg_id]
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  database_name        = var.database_name
  master_username      = var.master_username
  master_password      = var.master_password
  db_allocated_storage = var.db_allocated_storage
  instance_class       = var.instance_class
  depends_on           = [module.vpc, module.sg]
}