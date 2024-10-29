# core

A humble attempt to define core infrastructure as code.

## Why? 

As an engineer who has been born into the cloud-native world, I grew up with "Everything as code" is the way to do it. So that's why I try here in this repo, to define common infrastructure things like Github Repos, AWS IAM resources, DNS records and more in code.

This approach allows me to define 90% of the core stuff as code.

## The 10%

A golden rule is to automate 90% and write a runbook for the other 10% as the effort to automate these 10% is unreasonable. So this is the runbook for the 10%.

### Tailscale

Sign-up: using Github

Credentials: token is an OAuth client without expiration and all privileges

### DNS

Sign-up: manual

Credentials: API token without expiration

DNS Zones are registered by Infomaniak and the nameservers for Hetzner DNS were added manually.

### Github

Sign-up: manual

Credentials: Github Personal Access Token with sufficient permissions and no expiration 

The core repo was created manually. Other repos were imported to Terraform.

### Terraform Cloud

Sign-up: using HCP and then using Github

Credentials: API Token without expiration on the user-scope (covers all orgs)

The organization `technat` is created manually with the default project beeing "core". A Github App was installed on my user to allow Terraform Cloud access to my repositories.

### Hashicorp Cloud

Sign-up: using Github

Credentials: created according to [this doc](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth) for the entire organization.

The organization `technat` is created manually with the default project beeing "core".

### AWS

Sign-up: manual (+ creating a dedicated AWS User to not work with the root user)

Credentials: according to [this blog post](https://aws.amazon.com/blogs/apn/simplify-and-secure-terraform-workflows-on-aws-with-dynamic-provider-credentials/).

**Note**: Every resource created here must be tagged with `managed-by=terraform`. This is to ensure [account-nuker](https://github.com/the-technat/account-nuker) filters these resources from his regular nuke.
