data "aws_iam_policy_document" "key_policy" {
  version = "2012-10-17"
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
      ]

    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup"]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "Allow use of the key by local vault during copy back from the central vault"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup",
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root",
        "arn:${data.aws_partition.current.partition}:iam::${var.centralized_account_number}:root"
      ]
    }
    actions = [
      "kms:DescribeKey",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalType"
      values   = ["Root"]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup",
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root",
        "arn:${data.aws_partition.current.partition}:iam::${var.centralized_account_number}:root"
      ]
    }
    actions   = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
      ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }

}