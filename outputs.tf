output "region" {
  value = var.region
}

output "role_id" {
  value = aws_iam_role.default.id
}

output "full_prefix" {
  value = local.full_prefix
}

output "policy_arn" {
  description = "The ARN of the policy that allows access to the parameter store with KMS"
  value       = aws_iam_policy.default_with_kms.id
}

