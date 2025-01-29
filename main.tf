provider "aws" {
  alias = "platform_config_bucket"
  region = "eu-west-1"
}

locals {
    platform_prefix = (var.datacenter == "" ? data.aws_iam_account_alias.current.account_alias : var.datacenter)
}

data "aws_iam_account_alias" "current" {}

data "aws_s3_object" "platform_config" {
  provider = aws.platform_config_bucket
  bucket = var.bucket
  key = "${local.platform_prefix}/${var.platform_config_region}.json"
}

output "config" {
    value =  tomap(jsondecode(data.aws_s3_object.platform_config.body)["${var.config_name}"])
}
