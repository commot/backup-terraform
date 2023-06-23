resource "aws_backup_vault" "backup_vault" {
  name = "${var.location}-backup-vault"
  kms_key_arn = var.kms_key
  
}

resource "aws_backup_vault_policy" "backup_vault_policy" {
  count = var.vault_policy != null ? 1 : 0
  backup_vault_name = aws_backup_vault.backup_vault.name
  policy = var.vault_policy
  
}