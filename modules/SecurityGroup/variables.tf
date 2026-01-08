
variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where SG will be created"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
