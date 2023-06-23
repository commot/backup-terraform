# resource "aws_iam_role" "iam_role" {
#   name = var.iam_name

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = var.role_policy
  
# }

# resource "aws_iam_policy_attachment" "iam_attachment" {
#   for_each = var.attachment
#   name       = each.value.name
#   policy_arn = each.value.arn

#   policy_document = var.policy_document
# }

resource "aws_iam_service_linked_role" "backup_role" {
  aws_service_name = var.service_name
}