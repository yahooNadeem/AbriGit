
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, { Name = var.name })
}

# Private subnets — use your exact CIDR (10.0.0.0/28) via variable
locals {
  use_explicit_private_cidrs = length(var.private_subnet_cidrs) == var.private_subnet_count
}

resource "aws_subnet" "private" {
  count = var.private_subnet_count

  vpc_id = aws_vpc.this.id

  # If explicit CIDRs provided, use them; otherwise placeholder derivation
  cidr_block = local.use_explicit_private_cidrs
    ? var.private_subnet_cidrs[count.index]
    : cidrsubnet(var.cidr_block, 8, count.index)

  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    {
      Tier = "private",
      Name = length(var.private_subnet_names) == var.private_subnet_count
        ? var.private_subnet_names[count.index]
        : "Private-${count.index}"
    }
  )
}

# Private route table (no Internet route)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${var.name}-private-rt" })
}

# Associate each private subnet with the private route table
resource "aws_route_table_association" "private" {
  count          = var.private_subnet_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
