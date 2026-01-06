
variable "name" {
  type        = string
  description = "Name tag for the VPC (VPC_Practice)"
}

variable "cidr_block" {
  type        = string
  description = "CIDR for the VPC (e.g., 10.0.0.0/16)"
}

# You have exactly 1 private subnet (/28)
variable "private_subnet_count" {
  type        = number
  description = "Number of private subnets to manage"
  default     = 1
}

# Explicit CIDRs for private subnets. Set to [\"10.0.0.0/28\"] to match your existing subnet.
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Explicit CIDR blocks for private subnets; must match private_subnet_count if set"
  default     = []
}

# Explicit Name tags to match your existing subnet tag for import (My_PrivateSubnet)
variable "private_subnet_names" {
  type        = list(string)
  description = "Name tags for private subnets; must match private_subnet_count if set"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}
