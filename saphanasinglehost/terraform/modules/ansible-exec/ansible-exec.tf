resource "null_resource" "ansible-exec" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${var.IP}, ../ansible/saphanasinglehost.yml"
  }
}
