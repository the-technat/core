## branch ruleset
resource "github_repository_ruleset" "wunschliste_default" {
  name        = "default"
  repository  = github_repository.wunschliste.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  bypass_actors {
    actor_id    = 5
    actor_type  = "RepositoryRole"
    bypass_mode = "always"
  }

  rules {
    deletion                = true
    pull_request {}
    required_status_checks {
      required_check {
        context = "review_app"
      }
    }
  }
}

## prod env
resource "github_repository_environment" "wunschliste_prod" {
  environment         = "prod"
  repository          = github_repository.wunschliste.name
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}
resource "github_repository_environment_deployment_policy" "wunschliste_live" {
  repository     = github_repository.wunschliste.name
  environment    = github_repository_environment.wunschliste_prod.environment
  branch_pattern = "live"
}
data "hcp_vault_secrets_app" "wunschliste" {
  app_name = "wunschliste"
  provider = hcp.hcp_wunschliste
}
resource "github_actions_environment_secret" "wunschliste_prod-username" {
  repository     = github_repository.wunschliste.name
  environment    = github_repository_environment.wunschliste_prod.environment
  secret_name     = "FLATNOTES_USERNAME"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["PROD_USERNAME"]
}
resource "github_actions_environment_secret" "wunschliste_prod-password" {
  repository     = github_repository.wunschliste.name
  environment    = github_repository_environment.wunschliste_prod.environment
  secret_name     = "FLATNOTES_PASSWORD"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["PROD_PASSWORD"]
}
resource "github_actions_environment_secret" "wunschliste_prod-secret-key" {
  repository     = github_repository.wunschliste.name
  environment    = github_repository_environment.wunschliste_prod.environment
  secret_name     = "FLATNOTES_SECRET_KEY"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["PROD_SECRET_KEY"]
}

## general action secrets
resource "github_actions_secret" "wunschliste_review_username" {
  repository      = github_repository.wunschliste.name
  secret_name     = "REVIEW_USERNAME"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["REVIEW_USERNAME"]
}
resource "github_actions_secret" "wunschliste_review_password" {
  repository      = github_repository.wunschliste.name
  secret_name     = "REVIEW_PASSWORD"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["REVIEW_PASSWORD"]
}
resource "github_actions_secret" "wunschliste_review-secret-key" {
  repository      = github_repository.wunschliste.name
  secret_name     = "REVIEW_SECRET_KEY"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["REVIEW_SECRET_KEY"]
}
resource "github_actions_secret" "wunschliste_fly-org-token" {
  repository      = github_repository.wunschliste.name
  secret_name     = "FLY_ORG_API_TOKEN"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["FLY_ORG_API_TOKEN"]
}
resource "github_actions_secret" "wunschliste_gh-app-id" {
  repository      = github_repository.wunschliste.name
  secret_name     = "GH_APP_ID"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["GH_APP_ID"]
}
resource "github_actions_secret" "wunschliste_gh-app-private-key" {
  repository      = github_repository.wunschliste.name
  secret_name     = "GH_APP_PRIVATE_KEY"
  plaintext_value = data.hcp_vault_secrets_app.wunschliste.secrets["GH_APP_PRIVATE_KEY"]
}