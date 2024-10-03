provider "tailscale" {
  tailnet             = var.tailscale_tailnet
  oauth_client_id     = var.tailscale_oauth_client_id
  oauth_client_secret = var.tailscale_oauth_client_secret
}

provider "hetznerdns" {
  apitoken = var.hetzner_dns_token
}

provider "github" {
  token = var.github_token
}

provider "tfe" {
  token = var.tfc_token
}
