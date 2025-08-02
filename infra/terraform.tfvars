project_name          = "tier-3-app"
region                = "us-east-1"
vpc_cidr              = "10.0.0.0/16"
azs                   = ["us-east-1a", "us-east-1b"]
public_subnet_names   = ["public-subnet-1", "public-subnet-2"]
private_subnets_names = ["private-subnet-1", "private-subnet-2"]
private_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets        = ["10.0.101.0/24", "10.0.102.0/24"]