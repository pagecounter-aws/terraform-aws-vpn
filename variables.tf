variable "aws_vpc_id" {
  description = "AWS VPC id"
}

variable "customer_gateway" {
  description = "Customer Gateway"
}

variable "bgp_asn" {
  description = "BGP ASN"
  default     = 65000
}

variable "aws-vpn-connection" {
  description = "aws vpn connection name"
  default     = "aws-vpn-connection"
}
