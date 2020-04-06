/**
* # iam-role-policy-ssm
*
* Creates a IAM role and policy that allows an EC2 instance to fetch SSM params
* that begin with a prefix. Also allos the instance to fetch its own tags.
*/
module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

data "aws_caller_identity" "current" {
}

locals {
  full_prefix = "/${var.namespace}-${var.stage}-${var.name}/${var.path_prefix}"
}

resource "aws_iam_role" "default" {
  name = "${module.label.id}-ssm-access"
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
  name        = "${module.label.id}-${var.path_prefix}"
  description = "Policy that allows EC2 instances to get their SSM params with path prefix ${local.full_prefix}"
  policy      = data.aws_iam_policy_document.default_with_kms.json
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.id
  policy_arn = aws_iam_policy.default_with_kms.id
}

