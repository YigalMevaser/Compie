variable "alb_domain_name" {
  description = "Domain name of the ALB"
  type        = string
}

variable "cf_is_enabled" {
  description = "Whether the CloudFront distribution is enabled or not"
  type        = bool
}

variable "http_port" {  
  description = "HTTP port of the ALB"
  
}

variable "https_port" {  
  description = "HTTPS port of the ALB"
  
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
  description = "Time to live of the CloudFront distribution"
  type        = number
  
}

variable "d_ttl" {
  description = "Time to live of the CloudFront distribution"
  type        = number
  
}

variable "ma_ttl" {
  description = "Time to live of the CloudFront distribution"
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