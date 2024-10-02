terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "the-technat"

    workspaces {
      name = "core"
    }
  }
  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.17.1"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  }
}
