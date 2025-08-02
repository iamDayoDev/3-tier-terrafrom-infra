variable "project_name" {
    description = "Name tag for the VPC"
    type        = string
}
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
}
variable "public_subnet_names" {
    description = "List of public subnet CIDRs"
    type        = list(string)
}

variable "private_subnets_names" {
    description = "List of private subnet CIDRs"
    type        = list(string)
}

variable "public_subnets" {
    description = "List of public subnet CIDRs"
    type        = list(string)
}

variable "private_subnets" {
    description = "List of private subnet CIDRs"
    type        = list(string)
}

variable "azs" {
    description = "List of availability zones"
    type        = list(string)
}