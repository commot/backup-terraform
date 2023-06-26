module "backup_vault" {
  source = "../../Modules/Backup/Local_vault"

  location = var.location
  environment = var.environment
  key_alias = "${var.environment}-${var.location}-backup"
  centralized_account_number = var.centralized_account_number

}

module "backup_plan" {
  source = "../../Modules/Backup/Plan"

  for_each = local.plans

  name              = each.value.name
  rules             = lookup(each.value, "rules", null)
  centralized_vault = var.centrailized_vault_arn
  local_vault       = module.backup_vault.vault_name
  backup_role       = "arn:aws:iam::039754842072:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup"
  selection_tags    = lookup(each.value, "criteria", null) 
  location          = var.location
  environment = var.environment

}
