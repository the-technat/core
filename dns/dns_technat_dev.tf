# registered by infomaniak, NS entries were added manually
resource "hetznerdns_zone" "technat_dev" {
  name = "technat.dev"
  ttl  = 60
}

# Note: these are not all records in the zone, but the static ones