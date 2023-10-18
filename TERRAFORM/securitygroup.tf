resource "aws_security_group" "html" {
  name        = var.web_sg_config.name
  description = var.web_sg_config.description
  vpc_id      = aws_vpc.vpcaws.id
}

resource "aws_security_group_rule" "web" {
  count             = length(var.web_sg_config.rules)
  type              = var.web_sg_config.rules[count.index].type
  from_port         = var.web_sg_config.rules[count.index].from_port
  to_port           = var.web_sg_config.rules[count.index].to_port
  protocol          = var.web_sg_config.rules[count.index].protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.html.id

}

resource "aws_security_group" "java" {
  name        = var.app_sg_config.name
  description = var.app_sg_config.description
  vpc_id      = aws_vpc.vpcaws.id
}

resource "aws_security_group_rule" "web1" {
  count             = length(var.app_sg_config.rules)
  type              = var.app_sg_config.rules[count.index].type
  from_port         = var.app_sg_config.rules[count.index].from_port
  to_port           = var.app_sg_config.rules[count.index].to_port
  protocol          = var.app_sg_config.rules[count.index].protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.java.id

}