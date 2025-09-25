project_name             = "tier-3-app"
region                   = "us-east-1"
vpc_cidr                 = "10.0.0.0/16"
azs                      = ["us-east-1a", "us-east-1b"]
public_subnet_names      = ["public-subnet-1", "public-subnet-2"]
private_subnets_names    = ["private-subnet-1", "private-subnet-2"]
private_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets           = ["10.0.101.0/24", "10.0.102.0/24"]
app_instance_type        = "t2.micro"
app_asg_desired_capacity = 1
app_asg_min_size         = 1
app_asg_max_size         = 1
web_instance_type        = "t2.micro"
web_asg_desired_capacity = 1
web_asg_min_size         = 1
web_asg_max_size         = 1
cluster_identifier       = "app-db"
database_name            = "appdb"
db_username              = "admin"
db_password              = "password123"
instance_class           = "db.t3.medium"
db_engine                = "aurora-mysql"
db_engine_version        = "8.0.mysql_aurora.3.06.0"




