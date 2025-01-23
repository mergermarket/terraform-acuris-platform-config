locals {
  region = var.platform_config_region != "" ? var.platform_config_region : data.aws_region.current.name
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
  key = "${data.aws_iam_account_alias.current.account_alias}/${var.platform_config_region}.json"
}

output "config" {
    value =  tomap(jsondecode(data.aws_s3_object.platform_config.body)["${var.config_name}"])
}
