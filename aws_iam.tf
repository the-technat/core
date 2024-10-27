resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"]
}

data "aws_iam_policy_document" "nuker_trust" {
  statement {
    sid     = "undefined"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:the-technat/account-nuker:*"]
    }

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }
  }
}

resource "aws_iam_role" "nuker" {
  name               = "nuker"
  assume_role_policy = data.aws_iam_policy_document.nuker_trust.json

  tags = {
    managed-by = "terraform"
  }
}

resource "aws_iam_role_policy_attachment" "nuker-attach" {
  role       = aws_iam_role.nuker.name
  policy_arn = local.aws_admin_policy_arn
}

data "aws_iam_policy_document" "gh-grapes-trust" {
  statement {
    sid     = "undefined"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:the-technat/grapes:*"]
    }

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }
  }
}

resource "aws_iam_role" "gh-grapes" {
  name               = "gh-grapes"
  assume_role_policy = data.aws_iam_policy_document.gh-grapes-trust.json

  tags = {
    managed-by = "terraform"
  }
}

resource "aws_iam_role_policy_attachment" "gh-grapes-attach" {
  role       = aws_iam_role.gh-grapes.name
  policy_arn = local.aws_admin_policy_arn
}
