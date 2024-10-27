resource "tfe_project" "trials" {
  organization = data.tfe_organization.the-technat.name
  name         = "trials"
}

resource "tfe_project" "cappy" {
  organization = data.tfe_organization.the-technat.name
  name         = "cappy"
  description  = "Project for the cappy repo"
}
