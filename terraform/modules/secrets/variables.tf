variable "secret_name" {
  description = "Name of the secret in Secret Manager"
  type        = string
}

variable "secret_value" {
  description = "Value of the secret"
  type        = map(string)
}

variable "external_account_id" {
  description = "ID of the external AWS account to grant read access"
  type        = string
}