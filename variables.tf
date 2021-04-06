variable "name" {
}

variable "subnet_id" {
}

variable "vpc_id" {
}

variable "sg_id" {
}

variable "password" {
}

variable "port" {
  default = "5432"
}

variable "flavor" {
  default = "rds.pg.c6.large.2.ha"
}
