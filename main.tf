/**
* # iam-role-policy-ssm
*
* Creates a IAM role and policy that allows an EC2 instance to fetch SSM params
* that begin with a prefix. Also allos the instance to fetch its own tags.
*/
module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace   = var.namespace
  name        = var.name
  stage       = var.stage
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = concat(var.attributes, ["ssm"])
  tags        = var.tags
}

data "aws_caller_identity" "current" {
}

locals {
  label_order = ["namespace", "environment", "stage", "name"]
  id_context = {
    name        = module.label.name
    namespace   = module.label.namespace
    environment = module.label.environment
    stage       = module.label.stage
  }
  labels                    = [for l in local.label_order : local.id_context[l] if length(local.id_context[l]) > 0]
  label_prefix              = lower(join(module.label.delimiter, local.labels))
  path_prefix_name_friendly = replace(var.path_prefix, "/[^a-zA-Z0-9-]/", "-")
  full_prefix_input         = var.prefix_with_label ? "${local.label_prefix}/${var.path_prefix}" : "${var.path_prefix}"
  full_prefix               = substr(local.full_prefix_input, 0, 1) == "/" ? local.full_prefix_input : "/${local.full_prefix_input}"
}

resource "aws_iam_role" "default" {
  name = "${module.label.id}-r"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "default_with_kms" {
  statement {
    actions = [
      "kms:Decrypt",
    ]

    resources = [
      var.kms_key_arn,
    ]
  }

  statement {
    actions = [
      "ec2:DescribeTags",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "ssm:GetParameter",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
    ]

    resources = [
      "arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter${local.full_prefix}/*",
    ]
  }
}

resource "aws_iam_policy" "default_with_kms" {
  name        = module.label.id
  description = "Policy that allows EC2 instances to get their SSM params with path prefix ${local.full_prefix}"
  policy      = data.aws_iam_policy_document.default_with_kms.json
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.id
  policy_arn = aws_iam_policy.default_with_kms.id
}

