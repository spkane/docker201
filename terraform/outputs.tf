output "manager.ip" {
  value = "${aws_instance.manager.public_ip}"
}

output "worker.ips" {
  value = "${join(",", aws_instance.worker.*.public_ip)}"
}
