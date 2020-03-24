data "aws_vpc" "selected" {
  id = var.aws_vpc_id
}

resource "aws_vpn_gateway" "vpn-gw" {
  vpc_id          = var.aws_vpc_id
  amazon_side_asn = var.amazon_side_asn
}

resource "aws_customer_gateway" "cgw" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway
  type       = "ipsec.1"

  tags = {
    "Name" = "aws-customer-gw"
  }
}

resource "aws_vpn_gateway_route_propagation" "route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.vpn-gw.id
  route_table_id = data.aws_vpc.selected.main_route_table_id
}

resource "aws_vpn_connection" "aws-vpn-connection" {
  vpn_gateway_id      = aws_vpn_gateway.vpn-gw.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = false
  tunnel1_inside_cidr = var.tunnel1_inside_cidr
  tunnel2_inside_cidr = var.tunnel2_inside_cidr

  tags = {
    "Name" = var.aws-vpn-connection
  }
}
