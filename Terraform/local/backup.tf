module "backup_vault" {
  source = "../../Modules/Backup/Vault"

  kms_key  = module.kms.arn
  location = var.location

}

module "backup_plan" {
  source = "../../Modules/Backup/Plan"

  for_each = local.plans

  name              = each.value.name
  rules             = lookup(each.value, "rules", null)
  centralized_vault = var.centrailized_vault_arn
  local_vault       = module.backup_vault.vault_name
  backup_role       = module.iam.arn
  selection_tags    = lookup(each.value, "criteria", null) 
  kms_key           = module.kms.arn
  location          = var.location

}

module "kms" {
  source = "../../Modules/KMS"

  description = var.kms_description
  key_alias   = var.key_alias
  key_policy  = data.aws_iam_policy_document.key_policy.json

}

module "iam" {
  source = "../../Modules/IAM/Service_Role"

  service_name = "backup.amazonaws.com"
}

