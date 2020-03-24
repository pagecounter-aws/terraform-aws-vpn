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

variable "amazon_side_asn" {
  description = "Amazon ASN"
  default     = 64512
}

variable "aws-vpn-connection" {
  description = "aws vpn connection name"
  default     = "aws-vpn-connection"
}

variable "tunnel1_inside_cidr" {
  description = "aws tunnel1_inside_cidr"
  default     = null
}

variable "tunnel2_inside_cidr" {
  description = "aws tunnel2_inside_cidr"
  default     = null
}
