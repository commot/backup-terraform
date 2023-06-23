data "aws_iam_policy_document" "backup_key_policy" {
  statement {
    sid    = "Allow administration of and use of the key"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }

  statement {
    sid    = "Allow external accounts access as part of backup copy to central vault"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "kms:DescribeKey",
      "kms:ReEncryptTo",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext",
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant",
    ]
    resources = ["*"]
    condition {
      test      = "Bool"
      variable  = "kms:GrantIsForAWSResource"
      values    = [true]
    }
    condition {
      test      = "Bool"
      variable  = "aws:PrincipalOrgID"
      values    = [data.aws_organizations_organization.current.id]

    }
  }
}