resource "aws_vpn_gateway" "main" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.vpn_gateway_name
  }
}

resource "aws_customer_gateway" "main" {
  bgp_asn    = var.customer_gateway_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = {
    Name = var.customer_gateway_name
  }
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.main.id
  customer_gateway_id = aws_customer_gateway.main.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = var.vpn_connection_name
  }
}