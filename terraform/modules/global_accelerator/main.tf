resource "aws_globalaccelerator_accelerator" "accelerator" {
  name               = var.name
  enabled            = true
  ip_address_type    = "IPV4"
}

resource "aws_globalaccelerator_listener" "listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.accelerator.id
  protocol        = "TCP"
  port_range {
    from = 80
    to   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "endpoint_group" {
  listener_arn = aws_globalaccelerator_listener.listener.id

  endpoint_configuration {
    endpoint_id   = var.endpoint_primary
    weight        = 128
  }

  endpoint_configuration {
    endpoint_id   = var.endpoint_secondary
    weight        = 128
  }
}
