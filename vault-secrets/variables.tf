variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app comp all secrets"
    }

    roboshop-infra = {
      description = "Roboshop infra secrets"
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
    ssh = {
        secret = "roboshop-infra"
        value = {
          username = "azuser"
          password = "Devops@123456"
        }
    }
  }
}