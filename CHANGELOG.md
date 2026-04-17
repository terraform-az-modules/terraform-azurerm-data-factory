# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.2.0] - 2026-04-17
### :bug: Bug Fixes
- [`8a99476`](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/commit/8a994767897a2c41e94b97856258bd273f030176) - consolidate versions.tf, remove provider_meta, upgrade to azurerm >= 4.0 *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*
- [`c191caa`](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/commit/c191caa79870957bf549f99112b909f3e25121c4) - replace version placeholder in example versions.tf with >= 4.0 *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*

### :wrench: Chores
- [`87834dd`](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/commit/87834ddc5bac32bcbcd6f1082291e13c9d31f866) - add provider_meta for API usage tracking *(PR [#27](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/pull/27) by [@clouddrove-ci](https://github.com/clouddrove-ci))*
- [`587a2f8`](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/commit/587a2f88a60956f303c4a79170cd9c09b57b7929) - polish module with basic example, changelog, and version fixes *(PR [#28](https://github.com/terraform-az-modules/terraform-azurerm-data-factory/pull/28) by [@clouddrove-ci](https://github.com/clouddrove-ci))*


## [1.1.1] - 2026-03-20

### Changes
- Add provider_meta for API usage tracking
- Add terraform tests and pre-commit CI workflow
- Add SECURITY.md, CONTRIBUTING.md, .releaserc.json
- Standardize pre-commit to antonbabenko v1.105.0
- Set provider: none in tf-checks for validate-only CI
- Bump required_version to >= 1.10.0
[v1.2.0]: https://github.com/terraform-az-modules/terraform-azurerm-data-factory/compare/v1.1.1...v1.2.0
