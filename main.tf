terraform {
  cloud {
    organization = "isweluiz"
    workspaces {
      name = "terraform-workspace-cloud-provider"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_main_region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

  default_tags {
    tags = {
      Environment = "LAB"
      Name        = "Terraform LAB"
    }
  }
}

# Ansible Keys 
# resource "aws_key_pair" "ansible" {
#   key_name   = "ansible_key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrrb6CqBLHU4S8agZVdNv8U4wOZFw+zV1uT+2LAkc9l4wz5H54Kl0ivOv7kNdrlWJrGWSQ81GKpYzpWVRQsAuLKVzsaIubQLN8RAxolbVwetU/DDnWmQ0d6b8T6qH5owE/VY+dcFxvlsmZayF92OVzQH3cjgPyyBKM+QOJwFACFxAC4g7tTkJxgyCRZ11Vr8XCmgDk0Ss0zdVB/J29veGFsnHQK1E9BgnOLdbXZtnhKMQssAW5SJmsCTSmYwFoVG8frsc4LirjhFGJAGhgy7CWa6D/2gBP3uZ/M1LcbJiwBnpTw+lXmK5+gcpZTbDf4PSJMIrWiRnpKsNyKSNj5KeiwPuIuuIJo/LCsKoK1o/qaOQwfzkeHNBraYA3tN7aec89LWxyQGQ6MbgfHGUXS1Jmf+iYX6qd3JWSLpyr3ouFDoVDUq3iR2J062qojD53JhOfJ96V1dr2SoeYMvTVNoxLgCzCxcFT22WY7h8GFjAD7nSJicaf1Zu6bfHW1Eu+6P8= LAB"
# }

# Instance web
# module "ec2_instance_web" {
#   source = "./modules/ec2_web"

#   team_name               = "infra"
#   service_name            = "web"
#   env                     = var.env
#   ansible_key_name        = aws_key_pair.ansible.id
#   aws_main_region         = var.aws_main_region
#   instance_type           = "t3.micro"
#   instances_count_web     = 1
#   instance_root_disk_size = var.instance_root_disk_size
# }

# # IAM
# module "iam_role" {
#   source = "./modules/iam"

#   team_name    = "infra"
#   service_name = "web"
#   env          = var.env
# }
