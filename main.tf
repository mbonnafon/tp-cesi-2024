terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

resource "github_repository" "tp_terraform" {
  name = "tp-terraform"
  description = "test terraform"

  visibility = "public"
}