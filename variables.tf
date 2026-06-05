variable "oci_region_abbr_map" {
  type        = map(string)
  description = "Map of Oracle Cloud Infrastructure region identifiers to short abbreviations for naming resources"
  default = {
    "af-casablanca-1"   = "lej"
    "af-johannesburg-1" = "jnb"
    "ap-batam-1"        = "hsg"
    "ap-chuncheon-1"    = "yny"
    "ap-hyderabad-1"    = "hyd"
    "ap-kulai-2"        = "jbp"
    "ap-melbourne-1"    = "mel"
    "ap-mumbai-1"       = "bom"
    "ap-osaka-1"        = "kix"
    "ap-seoul-1"        = "icn"
    "ap-singapore-1"    = "sin"
    "ap-singapore-2"    = "xsp"
    "ap-sydney-1"       = "syd"
    "ap-tokyo-1"        = "nrt"
    "ca-montreal-1"     = "yul"
    "ca-toronto-1"      = "yyz"
    "eu-amsterdam-1"    = "ams"
    "eu-frankfurt-1"    = "fra"
    "eu-jovanovac-1"    = "beg"
    "eu-madrid-1"       = "mad"
    "eu-madrid-3"       = "orf"
    "eu-marseille-1"    = "mrs"
    "eu-milan-1"        = "lin"
    "eu-paris-1"        = "cdg"
    "eu-stockholm-1"    = "arn"
    "eu-turin-1"        = "nrq"
    "eu-zurich-1"       = "zrh"
    "il-jerusalem-1"    = "mtz"
    "me-abudhabi-1"     = "auh"
    "me-dubai-1"        = "dxb"
    "me-jeddah-1"       = "jed"
    "me-riyadh-1"       = "ruh"
    "mx-monterrey-1"    = "mty"
    "mx-queretaro-1"    = "qro"
    "sa-bogota-1"       = "bog"
    "sa-saopaulo-1"     = "gru"
    "sa-santiago-1"     = "scl"
    "sa-valparaiso-1"   = "vap"
    "sa-vinhedo-1"      = "vcp"
    "uk-cardiff-1"      = "cwl"
    "uk-london-1"       = "lhr"
    "us-ashburn-1"      = "iad"
    "us-chicago-1"      = "ord"
    "us-phoenix-1"      = "phx"
    "us-sanjose-1"      = "sjc"
  }
}

locals {
  oci_region_abbr_map_normalized = {
    for region_name, abbreviation in var.oci_region_abbr_map :
    lower(replace(region_name, "-", "")) => abbreviation
  }

  oci_region_abbr_lookup_map = merge(
    var.oci_region_abbr_map,
    local.oci_region_abbr_map_normalized,
  )
}
