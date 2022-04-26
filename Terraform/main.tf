terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}
provider "docker" {}

resource "docker_image" "mysite" {
  name         = "srinivaskarnati/srinivas-site"
  keep_locally = "false"
}

resource "docker_container" "mysite" {
  image = docker_image.mysite.latest
  name  = "mysite-container"
  ports {
    external = 8080
    internal = 80
  }
}
