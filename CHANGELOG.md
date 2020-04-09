# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `prefix_with_label` option added so you can fully control the path prefix.

### Changed

- ensured the names of created resources have invalid characters (like '/')
  removed, even though they may appear in the `path_prefix`
- handles the case when `path_prefix` is already prefixed with a `/` (and `prefix_with_label` is false)

### Removed

## [0.1.0] - 2020-04-04

### Added

- This CHANGELOG
- Initial version

### Changed

n/a

### Removed

n/a

[Unreleased]: https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/compare/0.1.0...HEAD
[0.1.0]: https://gitlab.com/guardianproject-ops/terraform-aws-ssm-param-store-iam/tag/0.1.0

