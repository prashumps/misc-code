resource "vault_mount" "kvv2" {
  for_each    = var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = each.value["description"]
}
