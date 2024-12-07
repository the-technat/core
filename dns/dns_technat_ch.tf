resource "hetznerdns_zone" "technat_ch" {
  name = "technat.ch"
  ttl  = 3600
}

# Note: these are not all records in the zone, but the static ones
# A records
resource "hetznerdns_record" "technat_ch_root_a" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "185.199.108.153"
  type    = "A"
  ttl     = 300
}

# AAAA records
resource "hetznerdns_record" "technat_ch_root_aaaa" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "2606:50c0:8000::153"
  type    = "AAAA"
  ttl     = 300
}

# CNAME records
resource "hetznerdns_record" "technat_ch_www_cname" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "www"
  value   = "the-technat.github.io."
  type    = "CNAME"
  ttl     = 300
}
resource "hetznerdns_record" "technat_ch_domainkey" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "sig1._domainkey"
  value   = "sig1.dkim.technat.ch.at.icloudmailadmin.com."
  type    = "CNAME"
  ttl     = 3600
}

# TXT records
resource "hetznerdns_record" "technat_ch_gh_pages_txt" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "_github-pages-challenge-the-technat"
  value   = "caf45f23a024b6e6e8c72e3ae2294c"
  type    = "TXT"
  ttl     = 300
}
resource "hetznerdns_record" "technat_ch_txt_apple_domain" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "apple-domain=jgaca9vNIXDfdTs8"
  type    = "TXT"
  ttl     = 3600
}
resource "hetznerdns_record" "technat_ch_txt_spf" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "v=spf1 include:icloud.com ~all"
  type    = "TXT"
  ttl     = 3600
}

# MX records
resource "hetznerdns_record" "technat_ch_mx1" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "10 mx01.mail.icloud.com."
  type    = "MX"
  ttl     = 3600
}
resource "hetznerdns_record" "technat_ch_mx2" {
  zone_id = hetznerdns_zone.technat_ch.id
  name    = "@"
  value   = "10 mx02.mail.icloud.com."
  type    = "MX"
  ttl     = 3600
}