output "public_ip" {
  value       = aws_instance.web.*.public_ip
  description = "The public IP address of the web server"
}

output "public_dns" {
  value       = aws_instance.web.*.public_dns
  description = "The public DNS-address of the web server"
}