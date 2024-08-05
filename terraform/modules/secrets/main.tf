resource "aws_secretsmanager_secret" "web_secret" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "web_secret" {
  secret_id     = aws_secretsmanager_secret.web_secret.id
  secret_string = jsonencode(var.secret_value)
}

resource "aws_secretsmanager_secret_policy" "web_secret" {
  secret_arn = aws_secretsmanager_secret.web_secret.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EnableCrossAccountAccess"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.external_account_id}:root"
        }
        Action   = "secretsmanager:GetSecretValue"
        Resource = "*"
      }
    ]
  })
}