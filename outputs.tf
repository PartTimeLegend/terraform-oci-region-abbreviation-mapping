output "oci_region_abbr_map" {
  value       = var.oci_region_abbr_map
  description = "The canonical map of Oracle Cloud Infrastructure region identifiers to abbreviations."
}

output "lookup_region_abbreviation" {
  value       = local.oci_region_abbr_lookup_map
  description = "Map for looking up an OCI region abbreviation from either the canonical region identifier or a normalized lowercase name without hyphens."
}

output "region_names" {
  value       = keys(var.oci_region_abbr_map)
  description = "List of canonical OCI region identifiers."
}

output "region_abbreviations" {
  value       = values(var.oci_region_abbr_map)
  description = "List of all region abbreviations."
}
