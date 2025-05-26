variable "name" {
  description = "Monitooringu mooduli nimi"
  type        = string
}

variable "alert_email" {
  description = "E-posti aadress alarmide jaoks"
  type        = string
}

variable "ec2_instance_id" {
  description = "Seotud EC2 instantsi ID"
  type        = string
}

variable "evaluation_periods" {
  description = "Hinnanguperioodide arv"
  type        = number
  default     = 2
}

variable "period" {
  description = "Mõõtmisperiood sekundites"
  type        = number
  default     = 300
}

variable "threshold" {
  description = "CPU künnis alarmi jaoks"
  type        = number
  default     = 70
}
