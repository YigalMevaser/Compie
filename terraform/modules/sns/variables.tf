variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "admin_phone_number" {
  description = "Phone number of the admin to receive SMS alerts"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "comparison_operator" {
  description = "Comparison operator of the CloudWatch alarm"
  type        = string
  
}

variable "evaluation_periods" {
  description = "Evaluation periods of the CloudWatch alarm"
  type        = number
  
}

variable "metric_name" {
  description = "Metric name of the CloudWatch alarm"
  type        = string
  
} 

variable "namespace" {
  description = "Namespace of the CloudWatch alarm"
  type        = string
  
} 

variable "period" {
  description = "Period of the CloudWatch alarm"
  type        = number
  
} 

variable "statistic" {
  description = "Statistic of the CloudWatch alarm"
  type        = string
  
}

variable "threshold" {
  description = "Threshold of the CloudWatch alarm"
  type        = number
  
} 