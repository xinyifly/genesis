provider "alicloud" {
  region = "cn-hongkong"
}

resource "alicloud_security_group" "blizzard" {}

resource "alicloud_instance" "blizzard" {
  image_id = "ubuntu_16_0402_64_20G_alibase_20170818.vhd"
  instance_type = "ecs.xn4.small"
  security_groups = ["${alicloud_security_group.blizzard.id}"]

  allocate_public_ip = true
  internet_max_bandwidth_out = 1
}
