
output "tunnel1_address" {
  value = aws_vpn_connection.aws-vpn-connection.tunnel1_address
}

output "tunnel1_preshared_key" {
  value = aws_vpn_connection.aws-vpn-connection.tunnel1_preshared_key
}

output "tunnel2_address" {
  value = aws_vpn_connection.aws-vpn-connection.tunnel2_address
}

output "tunnel2_preshared_key" {
  value = aws_vpn_connection.aws-vpn-connection.tunnel2_preshared_key
}

output "all" {
  value = aws_vpn_connection.aws-vpn-connection
}
