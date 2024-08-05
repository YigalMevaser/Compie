variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
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