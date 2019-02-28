variable "user_account_id" {}
variable "aws_region" {}
variable "vpc-name" {}
variable "vpc-cidr" {}
variable "availability-zones" {
    type = "list"
}
variable "private_subnets" {
    type = "list"
}
variable "public_subnets" {
    type = "list"
}
variable "enable_nat_gateway" {
  
}
variable "enable_vpn_gateway" {
  
}

variable "tags" {
    type = "map"
  
}