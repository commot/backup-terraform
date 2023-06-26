module "backup_vault" {
  source = "../../Modules/Backup/Centralized_vault"

  location = var.location
  environment = var.environment
  key_alias = "${var.environment}-${var.location}-backup"
  
}

