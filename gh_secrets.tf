resource "github_actions_secret" "account-nuker-aws-role" {
  repository       = github_repository.account-nuker.name
  secret_name      = "aws-role"
  plaintext_value  = aws_iam_role.nuker.arn
}
