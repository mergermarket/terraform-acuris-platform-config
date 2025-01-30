locals {
  region = var.platform_config_region != "" ? var.platform_config_region : data.aws_region.current.name
  platform_prefix = (var.datacenter == "" ? data.aws_iam_account_alias.current.account_alias : var.datacenter)
}

provider "aws" {
  alias = "platform_config_bucket"
  region = "eu-west-1"
}

data "aws_region" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_s3_object" "platform_config" {
  provider = aws.platform_config_bucket
  bucket = var.bucket
  key = "${local.platform_prefix}/${local.region}.json"
}

output "config" {
    value =  tomap(jsondecode(data.aws_s3_object.platform_config.body)["${var.config_name}"])
}
