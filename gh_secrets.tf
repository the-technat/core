resource "github_actions_secret" "account-nuker-aws-role" {
  repository       = github_repository.account-nuker.name
  secret_name      = "aws_role"
  plaintext_value  = aws_iam_role.nuker.arn
}
