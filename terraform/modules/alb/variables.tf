variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs of the subnets to place the ALB in"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "ID of the EC2 instances security group"
  type        = string
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