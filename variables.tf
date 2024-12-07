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

### Hetzner DNS
variable "hetzner_dns_token" {
  type        = string
  sensitive   = true
  description = "API Token for Hetzner DNS, provided by TFC"
}


### Github
variable "github_token" {
  type        = string
  sensitive   = true
  description = "The only GH PAT created manually, provided by TFC"
}

### Hashicorp Cloud
variable "hcp_client_id" {
  type        = string
  sensitive   = true
  description = "HCP Client ID, provided by TFC"
}

variable "hcp_client_secret" {
  type        = string
  sensitive   = true
  description = "HCP Client Secret, provided by TFC"
}
