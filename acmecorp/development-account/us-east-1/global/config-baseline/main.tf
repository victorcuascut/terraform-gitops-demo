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

module "config" {
    source  = "git::https://github.com/victorcuascut/terraform-config-baseline.git?ref=master"
    account_name = "${var.account_name}"
    business_unit = "${var.business_unit}"
    environment = "${var.environment}"
    aws_region = "${var.aws_region}"
}
