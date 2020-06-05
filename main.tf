# EC2 Instanz erstellen
resource "aws_instance" "web" {
  ami           = "ami-0a02ee601d742e89f"
  instance_type = "t2.micro"
  count         = 3
  user_data     = <<-EOF
              #!/bin/bash
              yum install httpd -y
              /sbin/chkconfig --levels 235 httpd on
              service httpd start
              instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
              region=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
              echo "<h1>$instanceId from $region</h1>" > /var/www/html/index.html              
              EOF

  tags = {
    Name = "Instanz ${count.index}"
  }
}