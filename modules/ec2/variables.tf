variable "name" {
  description = "Mooduli nimi"
  type        = string
}
variable "ami" {
  description = "AMI ID"
  type        = string
}
variable "instance_type" {
  description = "Instantsi tüüp"
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}
variable "security_group_ids" {
  description = "List turvagruppide ID-sid"
  type        = list(string)
}
variable "key_name" {
  description = "Võtme nimi"
  type        = string
}
variable "public_key_path" {
  description = "Avaliku võtme tee"
  type        = string
}