module "backup_vault" {
  source = "../../Modules/Backup/Vault"

  location = var.location
  vault_policy      = data.aws_iam_policy_document.vault_policy.json
  kms_key = module.kms.arn
  
}


module "kms" {
  source = "../../Modules/KMS"
  description = var.kms_description
  key_alias = var.key_alias
  key_policy = data.aws_iam_policy_document.backup_key_policy.json
}

