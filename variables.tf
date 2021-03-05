variable "bucket" {
    type        = string
    description = ""
}

variable "platform_config_region" {
    type        = string
    default     = "eu-west-1"
    description = "Aws region of desired platform target"
}