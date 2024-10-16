# All my GH repos, excluding existing archives & forks
resource "github_repository" "account-nuker" {
  name        = "account-nuker"
  description = "Nukes cloud accounts on a schedule"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "grapes" {
  name        = "grapes"
  description = "Kubernetes Cluster Factory"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "tevbox" {
  name        = "tevbox"
  description = "Spin up a development box in the cloud in no time"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "the-technat" {
  name         = "the-technat"
  description  = "My personal website where I share my (sometimes useless) knowledge with the world"
  visibility   = "public"
  homepage_url = "technat.ch"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true

  pages {
    build_type = "workflow"
    cname      = "technat.ch"
  }
}
resource "github_repository" "dotfiles" {
  name        = "dotfiles"
  description = "My engineering environment as code"
  visibility  = "public"
  topics      = ["chezmoi"]

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "alleaffengaffen_ch" {
  name         = "alleaffengaffen.ch"
  description  = "alleaffengaffen.ch website"
  visibility   = "public"
  homepage_url = "alleaffengaffen.ch"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true

  pages {
    build_type = "workflow"
    cname      = "alleaffengaffen.ch"
  }
}
resource "github_repository" "self-host-planning-poker" {
  name        = "self-host-planning-poker"
  description = "A hassle-free Planning Poker application to deploy everywhere."
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "technat_dev" {

  name        = "technat.dev"
  description = "Technat's truly unique homelab"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "cncf-training" {
  name        = "cncf-training"
  description = "Resources related to my CKS,CKA,CKAD training"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "cilium-testing" {
  name        = "cilium-testing"
  description = "Repo related to testing things around Cilium"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
resource "github_repository" "topologySpreadConstraints" {
  name        = "topologySpreadConstraints"
  description = "Testing topologySpreadConstraints configurations to find bad and good patterns"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "argocd-testing" {
  name        = "argocd-testing"
  description = "Testing resources around Argo CD"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "lambda_form_confirmation_mail" {
  name        = "lambda_form_confirmation_mail"
  description = "Simple lambda written in Go that sends a mail using SMTP to a given address with the content of the JSON that was submitted"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "salami" {
  name        = "salami"
  description = "The best name for a cloud-native software that I'm probably never gonna write"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "renovate-config" {
  name        = "renovate-config"
  description = "Self-hosted renovate in Github Actions"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "devcontainers" {
  name        = "devcontainers"
  description = "devcontainer.json for various use-cases"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}

resource "github_repository" "capi" {
  name        = "capi"
  description = "Cluster-API PoC"
  visibility  = "public"

  has_projects    = false
  has_wiki        = false
  has_discussions = false
  has_issues      = true
}
