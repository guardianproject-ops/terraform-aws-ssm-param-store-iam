variable "region" {
  type = string
}

variable "path_prefix" {
  type        = string
  description = "The path prefix to allow the instance to read from. IThe full prefix will be /namespace-stage-name/path_prefix"
}

variable "prefix_with_label" {
  type        = bool
  default     = true
  description = "If true, then the full prefix will be /namespace-stage-name/path_prefix. If you want to fully control the prefix, set this to false, in which case the full prefix will be /path_prefix"

}

variable "kms_key_arn" {
  type    = string
  default = "The KMS Key arn used to encrypt the SSM Parameters"
}

