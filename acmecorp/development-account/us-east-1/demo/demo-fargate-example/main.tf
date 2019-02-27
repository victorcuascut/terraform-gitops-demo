terraform {
  required_version = ">= 0.9.3"
  backend          "s3"             {}
}

provider "aws" {
  allowed_account_ids = [
    "${var.aws_account_id}"
  ]
  region = "${var.aws_region}"
}

module "fargate-example" {
    source  = "git::https://github.com/victorcuascut/terraform-fargate-example.git?ref=master"
    vpc_name =   "${var.vpc_name}"
    private_subnet_name =   "${var.private_subnet_name}"
    public_subnet_name =   "${var.public_subnet_name}"
    app_image =   "${var.app_image}"
    app_port  =   "${var.app_port}"
    app_count =   "${var.app_count}"
    fargate_cpu =   "${var.fargate_cpu}"
    fargate_memory =   "${var.fargate_memory}"
}
