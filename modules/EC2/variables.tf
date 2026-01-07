
variable "instance_type" {
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "sg_id" {
  type        = string
}

variable "ec2_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
