
variable "vpc_name" {
  type        = string
  description = "Name tag for VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "private_subnet_name" {
  type        = string
  description = "Name tag for private subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for private subnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
