# core

A humble attempt to define core infrastructure as code.

## Why? 

As an engineer who has been born into the cloud-native world, I grew up with "Everything as code" is the way to do it. So that's why I try here in this repo, to define common infrastructure things like Github Repos, AWS IAM resources, DNS records and more in code.

This approach allows me to define 90% of everything as code.

## The 10%

A golden rule is to automate 90% and write a runbook for the other 10% as the effort to automate these 10% is unreasonable. So every directory representing a service contains a README that documents the 10% done manually per account.

To get these folders to do something, a corresponding TFE workspace in Terraform Cloud exists. These workspaces were all created manually. Any credentials required for these workspaces were also added manually (e.g variables are always filled manually).
