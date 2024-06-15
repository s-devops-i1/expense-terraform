provider "vault" {
  address = "https://172.31.36.28:8200"
  token = var.vault_token
  skip_tls_verify = true
}
