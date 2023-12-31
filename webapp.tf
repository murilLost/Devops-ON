module "app" {
    source = "./webapp_deployment"
    application_name = "Devops-ON"
    application_version = "67e8749"
    artifact_bucket = "devops-on"
    worker_ami = "ami-053b0d53c279acc90"
    instance_profile = "CodeDeployDemo-EC2-Instance-Profile"
    backend_port = 8080
    subnets = [
    {
      az     = "us-east-1a",
      prefix = "10.1.1.0/24"
    },
    {
      az     = "us-east-1b",
      prefix = "10.1.2.0/24"
    },
    {
      az     = "us-east-1c",
      prefix = "10.1.3.0/24"
    }
  ]
}
