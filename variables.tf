variable "bucket" {
    type        = string
    description = ""
}

variable "config_name"{
    type = string
    default = "platform_config"
    description = "Name of the config section in the platform_config file"
}
variable "platform_config_region" {
    type        = string
    default     = ""
    description = "Aws region of desired platform target"
}

variable "platform_config_key" {
    type = string
    default = ""
    description = "Set the S3 bucket key's direct path for use within the platform_config."
}
