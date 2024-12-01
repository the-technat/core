data "hcp_project" "core" {
  project = "core/"
}

resource "hcp_project" "cappy" {
  name        = "cappy"
  description = "Project for cappy repo"
}

resource "hcp_project" "wunschliste" {
  name        = "wunschliste"
  description = "Project for wunschliste repo"
}
