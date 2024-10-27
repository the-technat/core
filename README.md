# core

A humble attempt to define core infrastructure as code.

## Why? 

As an engineer who has been born into the cloud-native world, I grew up with "Everything as code" is the way to do it. So that's why I'll try here in this repo, to define common infrastructure things like Tailnet's, DNS, repositories, workspaces and more in code.

## How?

I signed-up on [Terraform cloud](https://app.terraform.io/session) and created an organization for my Github user with one default project and workspace in it named like this repository. I installed the Terraform Cloud Github App into my account so that VCS-driven workflows can act on my behalf.

Everything in that workspace and this repo has been created/configured manually.

## Tailscale

Token is an OAuth client generated manually and added to the workspace variables.

Signed-up using Github, some settings can only be defined in the UI.
Configures basic settings and ACL's.

## DNS

Token is an API token generated manually and added to the workspace variables.

My DNS provider is Hetzner DNS. There are some zones and records defined in this repo. 

## Github

Token is a GH PAT with sufficient permissions and no expiration, added to the workspace variables.

Manages my Github repos and stuff in them.

## Terraform Cloud

Token is created for my User with no expiration, added to the workspace variables.

Manages organizations, projects, workspaces and more.

## Hashicorp Cloud

The organization `technat` is created manually with the default project beeing "core".

Credentials are created according to [this doc](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth) for the entire organization.

Manages projects, vault secrets and more.
