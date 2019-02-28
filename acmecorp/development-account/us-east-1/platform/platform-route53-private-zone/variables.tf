variable "user_account_id" {}
variable "aws_region" {}

variable "vpc_name" {}
variable "domain_name" {}
variable "comment" {
    default = ""
}
variable "tags" {
  type = "map"
  default = {}
}

variable "subject_alternative_names" {
  type = "list"
}