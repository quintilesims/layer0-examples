resource "layer0_load_balancer" "guestbook" {
  name        = "${var.load_balancer_name}"
  environment = "${var.environment_id}"

  port {
    host_port      = 80
    container_port = 80
    protocol       = "http"
  }
}

resource "layer0_service" "guestbook" {
  name          = "${var.service_name}"
  environment   = "${var.environment_id}"
  deploy        = "${layer0_deploy.guestbook.id}"
  load_balancer = "${layer0_load_balancer.guestbook.id}"
}

resource "layer0_deploy" "guestbook" {
  name    = "${var.deploy_name}"
  content = "${data.template_file.guestbook.rendered}"
}

data "template_file" "guestbook" {
  template = "${file("${path.module}/Dockerrun.aws.json")}"

  vars {
    backend_type   = "memory"
    backend_config = ""
  }
}
