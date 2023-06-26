resource "aws_backup_vault" "backup_vault" {
  name = "${var.environment}-${var.location}-backup-vault"
  kms_key_arn = module.kms.arn
  
}

resource "aws_backup_vault_policy" "backup_vault_policy" {
  backup_vault_name = aws_backup_vault.backup_vault.name
  policy      = data.aws_iam_policy_document.vault_policy.json
 
}

module "kms" {
  source = "../../KMS"
  description = var.kms_description
  key_alias = var.key_alias
  key_policy = data.aws_iam_policy_document.backup_key_policy.json
}
