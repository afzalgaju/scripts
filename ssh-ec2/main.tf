
resource "aws_instance" "myec2" {

    ami = var.ami-id
    instance_type = var.instance-type
    key_name = "Devops"

    connection {

      type ="ssh"
      user = "ec2-user"
      private_key = file("./Devops.pem")
      host = self.public_ip
    }
    
  provisioner "remote-exec" {

    inline = [
      "sudo yum install curl"
      
    ]
    
  }
  
}