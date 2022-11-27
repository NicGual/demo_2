resource "local_file" "inventory" {
    filename = "../ansible/inventory.txt"
    content     = << EOF
    [deploy]
    machine1 ansible_host=${aws_instance.machine-1.public_ip}  ansible_ssh_private_key_file=/var/lib/jenkins/workspace/demo pipeline/infrastructure/keys-machine-1 ansible_ssh_user=ubuntu
    EOF
}