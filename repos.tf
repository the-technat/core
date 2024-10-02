resource "github_repository" "account-nuker" {
  name        = "account-nuker"
  description = "Nukes cloud accounts on a schedule"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
import {
  id = "account-nuker"
  to = github_repository.account-nuker
}
