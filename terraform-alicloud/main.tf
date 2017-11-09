provider "alicloud" {
  region = "cn-hongkong"
}

resource "alicloud_security_group" "blizzard" {}

resource "alicloud_security_group_rule" "blizzard-ssh-in" {
  type = "ingress"
  ip_protocol = "tcp"
  port_range = "22/22"
  security_group_id = "${alicloud_security_group.blizzard.id}"
  cidr_ip = "0.0.0.0/0"
}

resource "alicloud_instance" "blizzard" {
  image_id = "ubuntu_16_0402_64_20G_alibase_20170818.vhd"
  instance_type = "ecs.xn4.small"
  security_groups = ["${alicloud_security_group.blizzard.id}"]

  allocate_public_ip = true
  internet_max_bandwidth_out = 1
}

resource "alicloud_key_pair" "light" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnBHrXuBvQ9xJaUkI5YrLvZ9FTIhxqLXlqJb0iD7SvoA04USEqDGyRUic23DxLAOuWmNKlrBA+nk3Kv65Zf6Hiicjcb4LhrHyUMks47mEQjGInoRFYDGxx3Znllf9+hF75tw9rYtRrn1N1dypCdEod5Sgqwyi3IVaTMeZO/lAic/Zmy21ACwdHw5uPxcO5pGvHzmEy/2JsuL+gIOtEBXfJyaY/YWUEm1IBaCGLIzxXIJ07oZeO9kNzi/Sxue7uGD/29FT59uk2jlh/mRNbH7W5rrguLUmWGCFfUybJ0EWST4Y2a1BL/XvQ/ePueZZ4+whZpJWA9x4Pb4vIVlmvrWjj zeyu@lanthanum"
}

resource "alicloud_key_pair_attachment" "light" {
  key_name = "${alicloud_key_pair.light.id}"
  instance_ids = ["${alicloud_instance.blizzard.id}"]
}
