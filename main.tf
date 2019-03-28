module "users" {
  source = "./modules/users"
  username = "荣锋亮"
  consul_host ="http://127.0.0.1:8500"
}
terraform {
  required_version = ">= 0.12.0"
}

resource "local_file" "foo" {
    content  = "${module.users.exec_shell}" 
    filename = "${path.module}/init.sh"
}

resource "local_file" "foo2" {
    // content  = "${templatefile(format("%s/%s",path.module,"backends.tmpl"), { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })}"
    content  = "${templatefile("${path.module}/backends.tmpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"]})}"
    filename = "${path.module}/init2.sh"
}

resource "local_file" "foo3" {
    content  = "${templatefile("${path.module}/gitlab.tpl", {
            gitlab_dbname = "gitlabhq_production222",  
            pg_username= "postgres",
            pg_password ="dalongdemo",
            pg_host= "localhost",
            pg_port=5000,
            redis_host="localhost",
            redis_port= 5001,
            redis_password="demoapp"
            })}"
    filename = "${path.module}/gitlab.rb"
    provisioner "local-exec" {
       command = "cat   ${path.module}/gitlab.rb > newconfig.rb"
    }
}

resource "local_file" "foo4" {
    content  = "${module.users.exec_shell}"
    filename = "${path.module}/init.sh"
}