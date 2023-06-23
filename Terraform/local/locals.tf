locals {
  plans = {
    "standard" = {
      name = "standard"
      rules = [
        {
          rule_name          = "daily"
          target_vault_name  = module.backup_vault.vault_name
          schedule           = "cron(0 8 ? * MON,TUE,WED,THU *)"
          local_delete_after = "7"
        centralized_delete_after = "14" }
      ]
      criteria = [
        {
          key   = "BackkupPlan"
          value = "standard" }
      ]
    }
  }
}