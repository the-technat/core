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

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = "15fd266b-b556-4ea4-89e2-8232dc363b30" # the default project named core
}

provider "aws" {
  region = "eu-central-2"
}
