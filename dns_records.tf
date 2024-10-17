# Note: these are not all records in the zone, but the static ones

# A records
resource "hetznerdns_record" "root_a" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "@"
  value   = "185.199.108.153"
  type    = "A"
  ttl     = 300
}
resource "hetznerdns_record" "flasche_a" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "flasche"
  value   = "45.43.163.225"
  type    = "A"
  ttl     = 3600
}

# AAAA records
resource "hetznerdns_record" "root_aaaa" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "@"
  value   = "2606:50c0:8000::153"
  type    = "AAAA"
  ttl     = 300
}

# CNAME records
resource "hetznerdns_record" "www_cname" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "www"
  value   = "alleaffengaffen.github.io."
  type    = "CNAME"
  ttl     = 300
}

# TXT records
resource "hetznerdns_record" "gh_pages_txt" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "_github-pages-challenge-the-technat"
  value   = "1ef1a2f85fa6072f44b7a9135794ae"
  type    = "TXT"
  ttl     = 300
}

# SRV records
resource "hetznerdns_record" "flasche_srv" {
  zone_id = hetznerdns_zone.alleaffengaffen_ch.id
  name    = "_minecraft._tcp.flasche"
  value   = "0 0 25654 flasche.alleaffengaffen.ch."
  type    = "SRV"
  ttl     = 3600
}
