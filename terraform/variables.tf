variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-west-2"
}

variable "alb_name" {
  description = "Name of application load balancer"
  type = string
}

variable "tg_name" {
  description = "Name of target group"
  type = string
}

variable "tg_port" {
  description = "Port of target group"
  type = string
}

variable "tg_protocol" {
  description = "Protocol of target group"
  type = string
}

variable "alb_isinternal" {
  description = "Whether the ALB is internal or not"
  type = bool
}

variable "listener_port" {
  description = "Port of the ALB listener"
  type = string
}

variable "listener_protocol" {
  description = "Protocol of the ALB listener"
  type = string
}

variable "cf_is_enabled" {
  description = "Whether the CloudFront distribution is enabled or not"
  type        = bool
}

variable "http_port" {  
  description = "HTTP port of the ALB"
  type = string
}

variable "https_port" {  
  description = "HTTPS port of the ALB"
  type = string
}

variable "qs_is_enabled" {
  description = "Whether the CloudFront distribution is enabled or not"
  type        = bool
  
}

variable "v_protocol_policy" {
  description = "Protocol policy of the CloudFront distribution"
  type        = string
  
}

variable "mi_ttl" {
  description = "Min Time to live of the CloudFront distribution"
  type        = number
  
}

variable "d_ttl" {
  description = "Default Time to live of the CloudFront distribution"
  type        = number
  
}

variable "ma_ttl" {
  description = "Max Time to live of the CloudFront distribution"
  type        = number
  
}

variable "restriction_type" {
  description = "Restriction type of the CloudFront distribution"
  type        = string
  
}

variable "cloudfront_default_certificate" {
  description = "Whether the CloudFront distribution uses a default certificate or not"
  type        = bool
  
}

variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "vpn_gateway_name" {
  description = "Name of the VPN Gateway"
  type        = string
}

variable "customer_gateway_asn" {
  description = "ASN of the Customer Gateway"
  type        = number
}

variable "customer_gateway_ip" {
  description = "IP address of the Customer Gateway"
  type        = string
}

variable "customer_gateway_name" {
  description = "Name of the Customer Gateway"
  type        = string
}

variable "vpn_connection_name" {
  description = "Name of the VPN Connection"
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