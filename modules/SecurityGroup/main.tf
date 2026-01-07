
resource "aws_security_group" "this" {
  name        = var.sg_name
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    { Name = var.sg_name }
  )
}

# SG Rules
resource "aws_security_group_rule" "rdp_access" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.6/32"]
  security_group_id = aws_security_group.this.id
  description       = "Allow RDP access"
}

resource "aws_security_group_rule" "smb_access" {
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.9/32"]
  security_group_id = aws_security_group.this.id
  description       = "Allow SMB access"
}
