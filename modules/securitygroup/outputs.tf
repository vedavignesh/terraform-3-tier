output "alb_security_goup_id" {
    value = aws_security_group.alb_security_group.id
}

output "ecs_security_goup_id" {
    value = aws_security_group.ecs_security_group.id
}