resource "aws_backup_vault" "backup_vault" {
  name = "${var.environment}-${var.location}-backup-vault"
  kms_key_arn = var.kms_key
  
}

module "kms" {
  source = "../../KMS"

  description = var.kms_description
  key_alias   = var.key_alias
  key_policy  = data.aws_iam_policy_document.key_policy.json

}

