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
    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url = "http://catalogue-dev.prashumps.online:8080/"
        user_url      = "http://user-dev.prashumps.online:8080/"
        cart_url      = "http://cart-dev.prashumps.online:8080/"
        shippinge_url = "http://shipping-dev.prashumps.online:8080/"
        payment_url   = "http://payment-dev.prashumps.online:8080/"
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