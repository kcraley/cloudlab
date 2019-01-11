data "template_file" "etcd-cloud-init" {
  count     = "${var.etcd-count}"
  template  = "${file("./cloud-init/ignition.json")}"

  vars {
    etcd-member-unit = "${element(data.template_file.etcd-member-unit.*.rendered, count.index)}"
  }
}

data "template_file" "etcd-member-unit" {
  count     = "${var.etcd-count}"
  template  = "${file("./cloud-init/etcd-member.service")}"
}
