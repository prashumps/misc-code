variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app comp all secrets"
    }
  }
}

variable "values" {
  default = {
    cart = {
      secret = "roboshop-dev"
      value = {
        zip = "zip"
        foo = "bar"
      }
    }
  }
}