data "aws_iam_policy_document" "vault_policy" {
  version = "2012-10-17"
  statement {
    sid       = "Allow source account to copy into backup vault"
    effect    = "Allow"
    actions   = ["backup:CopyIntoBackupVault"]
    resources = ["*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }
}