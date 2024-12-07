terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "ts"
    }
  }
  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.17.2"
    }
  }
}


provider "tailscale" {
  tailnet             = var.tailscale_tailnet
  oauth_client_id     = var.tailscale_oauth_client_id
  oauth_client_secret = var.tailscale_oauth_client_secret
}

### Tailscale
variable "tailscale_oauth_client_id" {
  type        = string
  sensitive   = true
  description = "OAuth Client ID for the OAuth Client, provided by TFC"
}

variable "tailscale_oauth_client_secret" {
  type        = string
  sensitive   = true
  description = "OAuth Client Secret for the OAuth Client, provided by TFC"
}

variable "tailscale_tailnet" {
  type        = string
  description = "Name of the tailnet we operate on (tailnet was created by signin-up using Github)"
  default     = "the-technat.github"
}