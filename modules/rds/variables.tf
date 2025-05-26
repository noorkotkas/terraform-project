variable "name" {
  description = "Mooduli nimi"
  type        = string
}
variable "db_identifier" {
  description = "Andmebaasi identifikaator"
  type        = string
}
variable "allocated_storage" {
  description = "Salvestusruum GB-des"
  type        = number
}
variable "engine" {
  description = "Andmebaasimootor (mysql, postgres)"
  type        = string
}
variable "engine_version" {
  description = "Mootori versioon"
  type        = string
}
variable "instance_class" {
  description = "RDS instantsi tüüp"
  type        = string
}
variable "username" {
  description = "Andmebaasi admin kasutajanimi"
  type        = string
}
variable "password" {
  description = "Andmebaasi parool"
  type        = string
}
variable "subnet_ids" {
  description = "List alamvõrkude ID-sid"
  type        = list(string)
}
variable "security_group_ids" {
  description = "List turvagruppide ID-sid"
  type        = list(string)
}