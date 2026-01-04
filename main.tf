# main.tf
provider "github" {
  owner = "Mariuscheng"
  token = "放KEY位置"
}

resource "github_repository" "demo" {
  name        = "learn-terraform-github"
  description = "Repo managed by Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch_protection" "demo_main" {
  repository_id = github_repository.demo.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}