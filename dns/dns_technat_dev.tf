# registered by infomaniak, NS entries were added manually
resource "hetznerdns_zone" "technat_dev" {
  name = "technat.dev"
  ttl  = 60
}

# Note: these are not all records in the zone, but the static ones
resource "hetznerdns_record" "ns_local_technat_dev_1" {
  zone_id = hetznerdns_zone.technat_dev.id
  name    = "local"
  value   = "ns-gce.sslip.io."
  type    = "NS"
  ttl     = 300
}
resource "hetznerdns_record" "ns_local_technat_dev_2" {
  zone_id = hetznerdns_zone.technat_dev.id
  name    = "local"
  value   = "ns-hetzner.sslip.io."
  type    = "NS"
  ttl     = 300
}
resource "hetznerdns_record" "ns_local_technat_dev_3" {
  zone_id = hetznerdns_zone.technat_dev.id
  name    = "local"
  value   = "ns-ovh.sslip.io."
  type    = "NS"
  ttl     = 300
}