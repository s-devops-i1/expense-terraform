output "vpc_id" {
  value = aws_vpc.dev.id
}

output "frontend_subnet" {
  value = aws_subnet.frontend.*.id
}

output "backend_subnet" {
  value = aws_subnet.backend.*.id
}

output "db_subnet" {
  value = aws_subnet.db.*.id
}

