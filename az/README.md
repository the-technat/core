# Azure

Sign-up: manual

Credentials:  according to [this doc](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/azure-configuration). The app is assigned the owner role in the subscription `technat` and also has `Application.ReadWrite.All`, `Application.ReadWrite.OwnedBy` and `AppRoleAssignment.ReadWrite.All` access on the Microsoft Graph API.

**Note**: Every resource created here must be tagged with `managed-by=terraform`. This is to ensure [account-nuker](https://github.com/the-technat/account-nuker) filters these resources from his regular nuke. For Azure AD resources tagging is not supported in a way azure-nuke can use, thus Azure AD resources **must** be added manually to account-nuker's filter list!