variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "cidr_block" {
  description = "VPC cidr"
  default     = "10.0.0.0/16"
}

variable "sub-1-pub-cidr_block" {
  description = "Sub1-Pub cidr"
  default     = "10.0.1.0/24"
}

variable "sub-1-prv-cidr_block" {
  description = "Sub1-Prv cidr"
  default     = "10.0.2.0/24"
}
