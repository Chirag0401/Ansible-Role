source "amazon-ebs" "basic-ami" {
  ami_name      = "Aadesh_NodeJS-CWA-CodeDeploy_AMI"
  instance_type = "t3a.small"
  ssh_username  = "ubuntu"
  source_ami    = "ami-0d5bf08bc8017c83b"
  region        = "us-east-2"
  subnet_id     = "subnet-09a50a0db3bdf9d87"
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_type = "gp3"
    volume_size = "10"
    delete_on_termination = "true"
  }
  tags = {
    Name  = "Aadesh-Ansible"
    Owner = "Aadesh"
  }
}
build {
  sources = [
    "source.amazon-ebs.basic-ami"
  ]
  provisioner "ansible" {
    playbook_file = "./nodejs_cwa_codedeploy.yml"
  }
}