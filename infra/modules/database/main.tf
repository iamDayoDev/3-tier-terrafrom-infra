resource "aws_rds_cluster" "aurora_mysql" {
    cluster_identifier      = var.cluster_identifier
    engine                 = var.db_engine
    engine_version         = var.db_engine_version
    master_username        = var.db_username
    master_password        = var.db_password
    db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.id
    database_name          = var.database_name
    vpc_security_group_ids = var.db_tier_sg_id
    skip_final_snapshot    = true
}

resource "aws_rds_cluster_instance" "aurora_instances" {
    count                  = 2
    identifier             = "${var.project_name}-instance-${count.index + 1}"
    cluster_identifier     = aws_rds_cluster.aurora_mysql.id
    instance_class         = var.instance_class
    engine                 = aws_rds_cluster.aurora_mysql.engine
    engine_version         = aws_rds_cluster.aurora_mysql.engine_version
    publicly_accessible    = false

    tags = {
        Name = "${var.project_name}-db-instance-${count.index + 1}"
    }
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
    name       = "aurora-subnet-group"
    subnet_ids = var.private_subnet_ids

    tags = {
        Name = "${var.project_name}-db-subnet-group"
    }
}