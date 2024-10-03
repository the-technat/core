resource "tfe_project" "trials" {
  organization = data.tfe_organization.the-technat.name
  name         = "trials"
}
