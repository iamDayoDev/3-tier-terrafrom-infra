# Outputs
output "vpc_id" {
    value = module.vpc
}

output "public_subnet_ids" {
    value = module.vpc.public_subnets
}

output "private_subnet_ids" {
    value = module.vpc.private_subnets
}