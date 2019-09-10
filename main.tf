
data "aws_vpc" "selected" {
  id = var.aws_vpc_id
}

resource "aws_vpn_gateway" "aws-vpn-gw" {
  vpc_id = var.aws_vpc_id
}

resource "aws_customer_gateway" "aws-cgw" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway
  type       = "ipsec.1"

  tags = {
    "Name" = "aws-customer-gw"
  }
}

resource "aws_vpn_gateway_route_propagation" "route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.aws-vpn-gw.id
  route_table_id = data.aws_vpc.selected.main_route_table_id
}

resource "aws_vpn_connection" "aws-vpn-connection" {
  vpn_gateway_id      = aws_vpn_gateway.aws-vpn-gw.id
  customer_gateway_id = aws_customer_gateway.aws-cgw.id
  type                = "ipsec.1"
  static_routes_only  = false

  tags = {
    "Name" = var.aws-vpn-connection
  }
}

# Allow traffic from the VPN subnets.
resource "aws_security_group" "aws-allow-vpn" {
  name        = "aws-allow-vpn"
  description = "Allow all traffic from vpn resources"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

