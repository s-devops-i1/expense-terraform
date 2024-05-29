resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  tags = {
    Name = var.component
  }

}

resource "null_resource" "ansible" {
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = var.ssh_user
      password = var.ssh_pass
      host     = aws_instance.instance.public_ip
    }

    inline = [
      "sudo pip3.22 install ansible",
      "ansible-pull -i localhost, -U https://github.com/s-devops-i1/expense-terraform.git -e env=${var.env} -e role_name=${var.component} expense-play.yml"
    ]
  }
}

resource "aws_route53_record" "record" {
  name    = "${var.component}-${var.env}"
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl     = 30
}
