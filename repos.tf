resource "github_repository" "account-nuker" {
  name        = "account-nuker"
  description = "Nukes cloud accounts on a schedule"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "grapes" {
  name        = "grapes"
  description = "Kubernetes Cluster Factory"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}

resource "github_repository" "tevbox" {
  name        = "tevbox"
  description = "Spin up a development box in the cloud in no time"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "the-technat" {
  name        = "the-techna"
  description = "My personal website where I share my (sometimes useless) knowledge with the world"
  visibility  = "public"

  has_projects = false
  has_wiki     = false

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

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "alleaffengaffen_ch" {
  name        = "alleaffengaffen.ch"
  description = "alleaffengaffen.ch website"
  visibility  = "public"

  has_projects = false
  has_wiki     = false

  pages {
    build_type = "workflow"
    cname      = "alleaffengaffen.ch"
  }
}
resource "github_repository" "self-host-planning-poker" {
  name        = "self-host-planning-poker"
  description = "A hassle-free Planning Poker application to deploy everywhere."
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "technat_dev" {

  name        = "technat.dev"
  description = "Technat's truly unique homelab"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "cks-training" {
  name        = "cks-training"
  description = "Resources related to my CKS training"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "cilium-testing" {
  name        = "cilium-testing"
  description = "Repo related to testing things around Cilium"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}
resource "github_repository" "topologySpreadConstraints" {
  name        = "topologySpreadConstraints"
  description = "Testing topologySpreadConstraints configurations to find bad and good patterns"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}

resource "github_repository" "argocd-testing" {
  name        = "argocd-testing"
  description = "Testing resources around Argo CD"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}

resource "github_repository" "lambda_form_confirmation_mail" {
  name        = "lambda_form_confirmation_mail"
  description = "Simple lambda written in Go that sends a mail using SMTP to a given address with the content of the JSON that was submitted"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}

resource "github_repository" "salami" {
  name        = "salami"
  description = "The best name for a cloud-native software that I'm probably never gonna write"
  visibility  = "public"

  has_projects = false
  has_wiki     = false
}

import {
  id = "salami"
  to = github_repository.salami
}
import {
  id = "lambda_form_confirmation_mail"
  to = github_repository.lambda_form_confirmation_mail
}
import {
  id = "argocd-testing"
  to = github_repository.argocd-testing
}
import {
  id = "topologySpreadConstraints"
  to = github_repository.topologySpreadConstraints
}
import {
  id = "cilium-testing"
  to = github_repository.cilium-testing
}
import {
  id = "cks-training"
  to = github_repository.cks-training
}
import {
  id = "technat.dev"
  to = github_repository.technat_dev
}
import {
  id = "self-host-planning-poker"
  to = github_repository.self-host-planning-poker
}
import {
  id = "alleaffengaffen.ch"
  to = github_repository.alleaffengaffen_ch
}
import {
  id = "dotfiles"
  to = github_repository.dotfiles
}
import {
  id = "the-technat"
  to = github_repository.the-technat
}
import {
  id = "tevbox"
  to = github_repository.tevbox
}
import {
  id = "grapes"
  to = github_repository.grapes
}
