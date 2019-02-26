user_account_id         = "399188165922"
aws_region              = "us-east-1"

vpc-name                = "demo-vpc"
vpc-cidr                = "10.11.0.0/16"
availability-zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets         = ["10.11.1.0/24", "10.11.2.0/24", "10.11.3.0/24"]
public_subnets          = ["10.11.101.0/24", "10.11.102.0/24", "10.11.103.0/24"]
enable_nat_gateway      = true
enable_vpn_gateway      = true
tags = {
    Terraform = "true"
    Environment = "test"
  }