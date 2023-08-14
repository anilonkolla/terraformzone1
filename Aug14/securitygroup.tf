resource "aws_security_group" "allow_tls" {
  name        = var.web_sg_config.name
  description = var.web_sg_config.description
  vpc_id      = aws_vpc.vpcaws.id
}

resource "aws_security_group_rule" "web_rules" {
  count             = length(var.web_sg_config.rules)
  type              = var.web_sg_config.rules[count.index].type
  from_port         = var.web_sg_config.rules[count.index].from_port
  to_port           = var.web_sg_config.rules[count.index].to_port
  protocol          = var.web_sg_config.rules[count.index].protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_tls.id

}



