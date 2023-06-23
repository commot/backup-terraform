resource "aws_backup_plan" "backup_plan" {
  
  name = "${var.name}-backup-plan"


  dynamic "rule" {
    for_each = var.rules
    content {

    rule_name = "${rule.value.rule_name}-backup-rule"
    target_vault_name = var.local_vault
    schedule = rule.value.schedule

    lifecycle {
      delete_after = rule.value.local_delete_after
    }

    copy_action {
      destination_vault_arn = "arn:aws:backup:us-east-1:475399058356:backup-vault:centralized-backup-vault"
      lifecycle {
        delete_after = rule.value.centralized_delete_after
    }
    }
    }

  }
  
}

resource "aws_backup_selection" "backup_selection" {

  iam_role_arn = var.backup_role
  name         = "${var.name}-backup-selection"
  plan_id      = aws_backup_plan.backup_plan.id

     dynamic "selection_tag" {
      for_each = var.selection_tags
      content {
     
         type  = "STRINGEQUALS"
         key   = selection_tag.value.key
         value = selection_tag.value.value
      }
   }
}
