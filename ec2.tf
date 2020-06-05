# EC2 Instanz erstellen
resource "aws_instance" "web" {
  ami           = "ami-0a02ee601d742e89f"
  instance_type = "t2.micro"
  count         = 3
  user_data     = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF

  tags = {
    Name = "Instanz ${count.index}"
  }
}