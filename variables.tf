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
    default     = "eu-west-1"
    description = "Aws region of desired platform target"
}