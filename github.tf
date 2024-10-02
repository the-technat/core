module "github" {
  source = "modules/github"
  providers = {
    github = github
  }
}
