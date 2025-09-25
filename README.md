## Overview

This repository contains Terraform modules for deploying a three-tier infrastructure on AWS. The architecture includes a VPC, public and private subnets, security groups, an application load balancer, EC2 instances for the web and app tiers, and an RDS database for the data tier.


![3-tier Architecture](3-tier-infra-project-design.png)

## Features

- Modular Terraform code for easy customization and reuse
- Automated provisioning of networking, compute, and database resources
- Secure separation of tiers using subnets and security groups
- Scalable and highly available design

## Architecture

The infrastructure is divided into three tiers:

1. **Web Tier**: Public subnets with EC2 instances behind an Application Load Balancer (ALB)
2. **App Tier**: Private subnets with EC2 instances
3. **Data Tier**: Private subnets with an RDS database instance

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or later
- AWS account with sufficient permissions
- AWS CLI configured with your credentials

## Usage

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/3-tier-terrafrom-infra.git
    cd 3-tier-terrafrom-infra
    ```

2. **Initialize Terraform:**
    ```bash
    terraform init
    ```

3. **Review and customize variables:**
    - Edit `variables.tf` or provide a `terraform.tfvars` file to override defaults.

4. **Plan the deployment:**
    ```bash
    terraform plan
    ```

5. **Apply the configuration:**
    ```bash
    terraform apply
    ```

6. **Destroy the infrastructure:**
    ```bash
    terraform destroy
    ```

## Module Structure

- `modules/vpc`: Creates VPC, subnets, route tables, and gateways
- `modules/security-groups`: Defines security groups for each tier
- `modules/alb`: Provisions the Application Load Balancer
- `modules/ec2`: Launches EC2 instances for web and app tiers
- `modules/rds`: Deploys the RDS database instance

## Notes

- Ensure your AWS credentials are set before running Terraform.
- The default configuration is for demonstration and may need adjustment for production use.
- Remember to destroy resources when done to avoid unnecessary AWS charges.

## License

This project is licensed under the MIT License.

