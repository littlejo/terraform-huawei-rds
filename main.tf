#TODO:
#encrypted data
#backup

data "huaweicloud_availability_zones" "myaz" {}

resource "huaweicloud_rds_instance" "instance" {
  db {
    password = var.password
    type     = "PostgreSQL"
    version  = "10"
    port     = var.port
  }
  ha_replication_mode = "async"
  name                = var.name
  security_group_id   = var.sg_id
  subnet_id           = var.subnet_id
  vpc_id              = var.vpc_id
  availability_zone = [
    data.huaweicloud_availability_zones.myaz.names[0],
    data.huaweicloud_availability_zones.myaz.names[1]
  ]
  volume {
    type = "ULTRAHIGH"
    size = 40
  }
  flavor = var.flavor
  backup_strategy {
    start_time = "08:00-09:00"
    keep_days  = 1
  }
}
