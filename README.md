# Terraform OCI Region Abbreviation Mapping

[![Tag](https://github.com/PartTimeLegend/terraform-oci-region-abbreviation-mapping/actions/workflows/tag.yml/badge.svg)](https://github.com/PartTimeLegend/terraform-oci-region-abbreviation-mapping/actions/workflows/tag.yml)

A simple module that provides mappings between Oracle Cloud Infrastructure region identifiers and standardized abbreviations for consistent resource naming.

## Features

- Mapping of OCI region identifiers to short abbreviations
- Supports both canonical region IDs and normalized lowercase names without hyphens
- Uses Oracle's published region keys as the default abbreviations
- Helper output map to simplify regional naming across OCI resources
- Zero external dependencies

## Usage

### Basic Usage

```terraform
locals {
  oci_region = "uk-london-1"
}

module "region_abbreviation_mapping" {
  source  = "PartTimeLegend/region-abbreviation-mapping/oci"
  version = "~> 1.0" # Replace with the latest version
}

output "region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.oci_region]
}
```

### Using Normalized Region IDs

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/oci"
}

locals {
  canonical_region  = "us-ashburn-1"
  normalized_region = "usashburn1"
}

output "canonical_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.canonical_region]
}

output "normalized_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.normalized_region]
}
```

### Using the Region Lookup Map

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/oci"
}

locals {
  resource_name = "${module.region_abbreviation_mapping.lookup_region_abbreviation["uk-london-1"]}-app"
}
```

## Available Outputs

| Name | Description |
| ---- | ----------- |
| `oci_region_abbr_map` | Canonical map of OCI region identifiers to their abbreviations |
| `lookup_region_abbreviation` | Lookup map supporting canonical region identifiers and normalized lowercase names without hyphens |
| `region_names` | List of canonical OCI region identifiers |
| `region_abbreviations` | List of all region abbreviations |

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
