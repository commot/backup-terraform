resource "aws_kms_key" "kms_key" {
    description = var.description    
  
}

resource "aws_kms_alias" "key_alias" {
    name = "alias/${var.key_alias}"
    target_key_id = aws_kms_key.kms_key.id
  
}

resource "aws_kms_key_policy" "key_policy" {
    key_id = aws_kms_key.kms_key.id
    policy = var.key_policy
  
}