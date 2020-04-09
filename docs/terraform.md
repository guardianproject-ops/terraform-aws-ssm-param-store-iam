# iam-role-policy-ssm

Creates a IAM role and policy that allows an EC2 instance to fetch SSM params  
that begin with a prefix. Also allos the instance to fetch its own tags.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| attributes | Additional attributes (e.g., `one', or `two') | `list` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | `string` | `"-"` | no |
| kms\_key\_arn | n/a | `string` | `"The KMS Key arn used to encrypt the SSM Parameters"` | no |
| name | Name  (e.g. `app` or `database`) | `string` | n/a | yes |
| namespace | Namespace (e.g. `org`) | `string` | n/a | yes |
| path\_prefix | The path prefix to allow the instance to read from. IThe full prefix will be /namespace-stage-name/path\_prefix | `string` | n/a | yes |
| prefix\_with\_label | If true, then the full prefix will be /namespace-stage-name/path\_prefix. If you want to fully control the prefix, set this to false, in which case the full prefix will be /path\_prefix | `bool` | `true` | no |
| region | n/a | `string` | n/a | yes |
| stage | Environment (e.g. `test`, `dev`) | `string` | n/a | yes |
| tags | Additional tags (e.g. map(`Visibility`,`Public`) | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| full\_prefix | n/a |
| policy\_arn | The ARN of the policy that allows access to the parameter store with KMS |
| region | n/a |
| role\_id | n/a |

