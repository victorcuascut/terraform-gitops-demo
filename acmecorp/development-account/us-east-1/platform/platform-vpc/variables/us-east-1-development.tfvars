user_account_id         = "399188165922"
aws_region              = "us-east-1"

vpc-name                = "platform-vpc"
vpc-cidr                = "10.10.0.0/16"
availability-zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets         = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
public_subnets          = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
enable_nat_gateway      = true
enable_vpn_gateway      = true
tags = {
    Terraform = "true"
    Environment = "test"
  }