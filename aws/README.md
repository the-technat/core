# AWS

Sign-up: manual (+ creating a dedicated AWS User to not work with the root user)

Link: aws.amazon.com

State sharing: with gh and tfc workspace

Credentials: according to [this blog post](https://aws.amazon.com/blogs/apn/simplify-and-secure-terraform-workflows-on-aws-with-dynamic-provider-credentials/).

**Note**: Every resource created here must be tagged with `managed-by=terraform`. This is to ensure [account-nuker](https://github.com/the-technat/account-nuker) filters these resources from his regular nuke.