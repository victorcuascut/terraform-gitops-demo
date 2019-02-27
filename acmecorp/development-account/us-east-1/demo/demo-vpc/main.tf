terraform {
  required_version = ">= 0.9.3"
  backend          "s3"             {}
}

provider "aws" {
  allowed_account_ids = [
    "${var.user_account_id}"
  ]
  region = "${var.aws_region}"
}
module "vpc" {
    source = "git::https://github.com/victorcuascut/terraform-aws-vpc.git?ref=master"
    vpc-name = "${var.vpc-name}"
    vpc-cidr = "${var.vpc-cidr}"
    availability-zones = "${var.availability-zones}"
    private_subnets = "${var.private_subnets}"
    public_subnets = "${var.public_subnets}"
    enable_nat_gateway = "${var.enable_nat_gateway}"
    enable_vpn_gateway = "${var.enable_vpn_gateway}"
    tags = "${var.tags}"
}
