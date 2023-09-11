resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.application_name}-node-"
  image_id      = var.worker_ami
  instance_type = "t2.micro"
  iam_instance_profile = var.instance_profile
  user_data = <<EOF
#! /bin/bash
sudo apt-get update && apt-get install foo bar ...
sudo apt install openjdk-11-jre-headless --fix-missing
y
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws s3 cp s3://${var.artifact_bucket}/${var.application_version} ./ --recursive
sudo java -jar *.jar
EOF

  security_groups = [aws_security_group.application_server_security_group.id]

  key_name = "Devops-ON"



  lifecycle {
    create_before_destroy = true
  }
}
