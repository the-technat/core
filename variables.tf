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
