job "pihole" {
  datacenters = ["homelab"]
  type = "system"

  group "pihole" {
    network {
      mode = "bridge"

      port "dhcp" {
        static       = 67
        to           = 67
      }
      port "dns" {
        static       = 53
        to           = 53
      }
      port "http" {
        static       = 7777
        to           = 80
      }
    }

    task "server" {
      driver = "docker"

      config {
        image = "pihole/pihole:2022.05"
        ports = [
          "dns",
          "dhcp",
          "http",
        ]
        volumes  = [
          "/opt/data/pihole/pihole/:/etc/pihole/",
          "/opt/data/pihole/dnsmasq/:/etc/dnsmasq.d/",
          "/opt/data/pihole/pihole.log:/var/log/pihole.log",
        ]
      }
    }
  }
}
