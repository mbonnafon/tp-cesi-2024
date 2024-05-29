variable "years" {
  type = list(string)
}

resource "github_repository" "tp_cesi" {
  for_each    = toset(var.years)
  name        = "tp-cesi-${each.key}"
  description = "Cours DevOps ${each.key}"

  has_projects = true
  has_issues   = true

  visibility = "public"

  template {
    owner      = "mbonnafon"
    repository = "tp-cesi-${each.key}"
  }
}

resource "github_branch_protection_v3" "main" {
  depends_on = [github_repository.tp_cesi]
  for_each = toset(var.years)

  repository = github_repository.tp_cesi[each.key].name
  branch     = "main"

  restrictions {
    users = ["foo-user"]
  }
}

resource "github_branch_protection_v3" "develop" {
  depends_on = [github_repository.tp_cesi]
  for_each = toset(var.years)

  repository = github_repository.tp_cesi[each.key].name
  branch     = "develop"

  restrictions {
    users = ["foo-user"]
  }
}