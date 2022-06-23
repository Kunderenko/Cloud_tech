resource "docker_network" "private_network" {
  name = "net"
}

resource "docker_image" "wordpress" {
  name         = "dkunderenko/task9:wordpress-nginx"
  keep_locally = false
}

resource "docker_image" "mysql" {
  name         = "dkunderenko/task9:wordpress-mysql"
  keep_locally = false
}

resource "docker_container" "wordpress" {
  image = docker_image.wordpress.latest
  name  = "wordpress_nginx"

  ports {
    internal = 80
    external = 8008
  }

  networks_advanced {
    name    = docker_network.private_network.name
    aliases = ["net"]
  }
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.latest
  name  = "wordpress_mysql"

  networks_advanced {
    name    = docker_network.private_network.name
    aliases = ["net"]
  }
}