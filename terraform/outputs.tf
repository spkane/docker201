output "manager-ips" {
  value = join(",", aws_instance.manager.*.public_ip)
}

output "worker-ips" {
  value = join(",", aws_instance.worker.*.public_ip)
}
