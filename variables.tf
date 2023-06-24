variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "sg_allow_default_port" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "Default allowed ports"
}

variable "aws_main_region" {
  type    = string
  default = "us-east-2"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "team_name" {
  type = string
  default = "infra"
}

variable "service_name" {
  type = string
  default = "web"
}

variable "instances_count_web" {
  type = number
  default = 1
}

variable "instance_root_disk_size" {
  type = number
  default = 10
}

variable "ansible_key_name" {
  type = string
}

variable "ansible_public_key" {
  type      = string
  sensitive = true
  default = ""
}

variable "instance_root_disk_type" {
  type = string
  default = "standard"
}

