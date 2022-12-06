resource "local_file" "inventory" {
    filename = "../../ansible/inventory.txt"
    content     = <<-EOF
    [deploy]
    machine1 ansible_host=${aws_instance.machine-1.public_ip}  ansible_ssh_private_key_file=/home/ubuntu/jenkins/workspace/'demo pipeline'/infrastructure/keys-machine-1 ansible_ssh_user=ubuntu
    machine3 ansible_host=${aws_instance.machine-3.public_ip}  ansible_ssh_private_key_file=/home/ubuntu/jenkins/workspace/'demo pipeline'/infrastructure/keys-machine-3 ansible_ssh_user=ubuntu
    [build]
    machine2 ansible_host=${aws_instance.machine-2.public_ip}  ansible_ssh_private_key_file=/home/ubuntu/jenkins/workspace/'demo pipeline'/infrastructure/keys-machine-2 ansible_ssh_user=ubuntu
    machine1 ansible_host=${aws_instance.machine-4.public_ip}  ansible_ssh_private_key_file=/home/ubuntu/jenkins/workspace/'demo pipeline'/infrastructure/keys-machine-4 ansible_ssh_user=ubuntu
    EOF
}