output "fe_instances_private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.fe_keypair.private_key_openssh
  sensitive   = true
}
# terraform output -raw fe_instances_private_key > fe-sshkey.pem
# chmod 400 fe-sshkey.pem
# curl -s http://169.254.169.254/latest/meta-data/public-ipv4