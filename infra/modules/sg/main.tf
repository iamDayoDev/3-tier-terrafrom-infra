resource "aws_security_group" "external_alb_sg" {
    name        = "${var.project_name}-external-alb-sg"
    description = "Security group for External ALB"
    vpc_id      = var.vpc_id

    ingress {
        description      = "Allow HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description      = "Allow HTTP"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }


    egress {
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-external-alb-sg"
        Project = var.project_name
    }
}

resource "aws_security_group" "web_tier_sg" {
    name        = "${var.project_name}-web-alb-sg"
    description = "Security group for Web Tier"
    vpc_id      = var.vpc_id

    ingress {
        description      = "Allow HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        security_groups  = [aws_security_group.external_alb_sg.id]
    }


    egress {
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-web-tier-sg"
        Project = var.project_name
    }
}

resource "aws_security_group" "internal_alb_sg" {
    name        = "${var.project_name}-external-alb-sg"
    description = "Security group for External ALB"
    vpc_id      = var.vpc_id

    ingress {
        description      = "Allow HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description      = "Allow HTTP"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }


    egress {
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-internal-alb-sg"
        Project = var.project_name
    }
}

resource "aws_security_group" "app_tier_sg" {
    name        = "${var.project_name}-app-tier-sg"
    description = "Security group for App Tier"
    vpc_id      = var.vpc_id

    ingress {
        description      = "Allow HTTP from Web Tier"
        from_port        = 4000
        to_port          = 4000
        protocol         = "tcp"
        security_groups  = [aws_security_group.internal_alb_sg.id]
    }


    egress {
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-app-tier-sg"
        Project = var.project_name
    }
}

resource "aws_security_group" "db_tier_sg" {
    name        = "${var.project_name}-db-tier-sg"
    description = "Security group for DB Tier"
    vpc_id      = var.vpc_id

    ingress {
        description      = "Allow MySQL/Aurora from App Tier"
        from_port        = 3306
        to_port          = 3306
        protocol         = "tcp"
        security_groups  = [aws_security_group.app_tier_sg.id]
    }

    egress {
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-db-tier-sg"
        Project = var.project_name
    }
}

