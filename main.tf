data "aws_iam_account_alias" "current" {}
data "aws_region" "current" {}


data "aws_s3_bucket_object" "platform_config" {
  bucket = "${var.bucket}"
  key = "${data.aws_iam_account_alias.current.account_alias}/${data.aws_region.current.name}.json"
}

output "config" {
    value = "${tomap(jsondecode(data.aws_s3_bucket_object.platform_config.body).platform_config)}"
}