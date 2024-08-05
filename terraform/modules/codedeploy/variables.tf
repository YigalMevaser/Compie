variable "app_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "deployment_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}

variable "ec2_tag_value" {
  description = "Value of the EC2 tag to identify deployment targets"
  type        = string
}