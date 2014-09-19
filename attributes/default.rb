# Fail2ban
default[:cespi_server_security][:fail2ban][:enabled] = true
default[:cespi_server_security][:fail2ban][:ignoreip] = "127.0.0.1/8"
default[:cespi_server_security][:fail2ban][:findtime] = "600"
default[:cespi_server_security][:fail2ban][:bantime] = "600"
default[:cespi_server_security][:fail2ban][:maxretry] = "3"
default[:cespi_server_security][:fail2ban][:destemail] = "infra@desarrollo.unlp.edu.ar"
# Specific services
default[:cespi_server_security][:fail2ban][:ssh][:enabled] = true
default[:cespi_server_security][:fail2ban][:ssh][:maxretry] = "5"
default[:cespi_server_security][:fail2ban][:postfix][:enabled] = false
default[:cespi_server_security][:fail2ban][:courierauth][:enabled] = false
default[:cespi_server_security][:fail2ban][:sasl][:enabled] = false
