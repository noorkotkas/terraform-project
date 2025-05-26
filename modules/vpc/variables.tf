variable "name" {
  description = "VPC nimi"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC CIDR plokk"
  type        = string
}
variable "public_subnets" {
  description = "Avalike alamvõrkude CIDR-plokid"
  type        = list(string)
}
variable "public_azs" {
  description = "Avalike alamvõrkude saadavuspiirkonnad"
  type        = list(string)
}