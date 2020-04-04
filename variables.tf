variable "region" {
  type = string
}

variable "path_prefix" {
  type        = string
  description = "The path prefix to allow the instance to read from. The full prefix will be /namespace-stage-name/path_prefix"
}

variable "kms_key_arn" {
  type    = string
  default = "The KMS Key arn used to encrypt the SSM Parameters"
}

