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
        REDIS_HOST="redis-dev.prashumps.online"
        CATALOGUE_HOST="catalogue-dev.prashumps.online"
        CATALOGUE_PORT=8080
      }
    }

    catalogue = {
      secret = "roboshop-dev"
      value = {
        MONGO="true"
        MONGO_URL="mongodb://mongodb-dev.prashumps.online:27017/catalogue"
      }
    }

    user = {
      secret = "roboshop-dev"
      value = {
        MONGO="true"
        REDIS_URL="redis://redis-dev.prashumps.online:6379"
        MONGO_URL="mongodb://mongodb-dev.prashumps.online:27017/users"
      }
    }

    shipping = {
      secret = "roboshop-dev"
      value = {
        CART_ENDPOINT ="cart-dev.prashumps.online:8080"
        DB_HOST ="mysql-dev.prashumps.online"
        username = "root"
        password = "RoboShop@1"
      }
    }

    payment = {
      secret = "roboshop-dev"
      value = {
        CART_HOST="cart-dev.prashumps.online"
        CART_PORT="8080"
        USER_HOST="user-dev.prashumps.online"
        USER_PORT="8080"
        AMQP_HOST="rabbitmq-dev.prashumps.online"
        AMQP_USER="roboshop"
        AMQP_PASS="roboshop123"
      }
    }

    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url = "http://catalogue-dev.prashumps.online:8080/"
        user_url      = "http://user-dev.prashumps.online:8080/"
        cart_url      = "http://cart-dev.prashumps.online:8080/"
        shipping_url  = "http://shipping-dev.prashumps.online:8080/"
        payment_url   = "http://payment-dev.prashumps.online:8080/"
      }
    }

    rabbitmq = {
      secret = "roboshop-dev"
      value = {
        username = "roboshop"
        password = "roboshop123"
      }
    }

    mysql = {
      secret = "roboshop-dev"
      value = {
        username = "root"
        password = "RoboShop@1"
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