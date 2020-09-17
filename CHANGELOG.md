# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [3.1.0](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/compare/3.0.1...3.1.0) (2020-09-17)


### Features

* Update to context.tf ([d5a0b23](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/d5a0b2377cfbf95a27cb1782f983ec82b34bf6bf))

### [3.0.1](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/compare/3.0.0...3.0.1) (2020-09-03)


### Bug Fixes

* upgrade null label dependency ([e29620c](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/e29620cf4a78dc69768034a35bdcce1e29aa063a))

## [3.0.0](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/compare/2.0.0...3.0.0) (2020-09-03)


### ⚠ BREAKING CHANGES

* upgrade to terraform 0.13

### Features

* upgrade to terraform 0.13 ([f498959](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/f4989591c8ffb2ed575e3db2edafbbe428cae542))

## [2.0.0](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/compare/1.1.0...2.0.0) (2020-07-02)


### ⚠ BREAKING CHANGES

* This name change will cause your roles to be
re-created, but nothing has functionally changed.

### Features

* Reduce length of IAM role name ([d0d05e6](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/d0d05e6d57a8716091f0bf4f5c2bc7e1a4181393))

## 1.1.0 (2020-05-13)


### Features

* Add `prefix_with_label` option ([2e2444d](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/2e2444d0807cb8eba8ad4a7c475ab13c80ec02c2))
* Support 'stage' and 'environment' label params ([cf03154](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/cf03154543fe2444f9bdc4ebb6173ac99deca45b))


### Bug Fixes

* Ensure the names of created resources have invalid characters (like '/') removed ([0714c4c](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/0714c4c3081335ca0f84dd99ae6ddb3f968a1425))
* Handle the case when `path_prefix` is already prefixed with a `/` ([959abef](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/959abef82e32b5017cac279058a7b34ab2561e16))
* Use label id as policy name ([6dc5f08](https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/commit/6dc5f08a7c95362a4908f05e01830b5d31af1e33))

## 0.1.0 - 2020-04-04

### Added

- This CHANGELOG
- Initial version
