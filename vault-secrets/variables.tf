variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app comp all secrets"
    }
  }
}
