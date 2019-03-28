data "template_file" "init" {
  template = "${file(format("%s/%s",path.module,"init.tpl"))}"
  vars = {
    name = "${var.username}"
    age = 444
    consul_host = "${var.consul_host}"
    platform ="mobile"
  }
}