variable "name" {
  description = "Mooduli nimi"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "ssh_cidrs" {
  description = "SSH lubatud CIDR plokid"
  type        = list(string)
}