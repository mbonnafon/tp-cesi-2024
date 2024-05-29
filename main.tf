terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tp-cesi-bis"
    workspaces {
      name = "tp-cesi-2024"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    owner = "mbonnafon"
}

resource "github_repository" "tp_cesi_2024" {
  name        = "tp-cesi-2024"
  description = "Cours DevOps 2024"

  has_projects = true
  has_issues = true

  visibility = "public"
}
