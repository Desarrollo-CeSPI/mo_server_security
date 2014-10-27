##########
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


######################################
# SSH service.

# Enable configuration of sshd service
default[:cespi_server_security][:ssh_config][:enabled] = true
# OpenSSH recipe parameters
default['openssh']['server']['use_privilege_separation'] = 'yes'
default['openssh']['server']['permit_root_login'] = 'without-password'
default['openssh']['server']['password_authentication'] = 'no'
default['openssh']['server']['max_auth_tries'] = '4'
default['openssh']['server']['pubkey_authentication'] = 'yes'
default['openssh']['server']['x11_forwarding'] = 'no'
default['openssh']['server']['print_motd'] = 'no'
default['openssh']['server']['print_lastlog'] = 'yes'
default['openssh']['server']['t_c_p_keep_alive'] = 'yes'
default['openssh']['server']['challenge_response_authentication'] = 'no'
default['openssh']['server']['use_p_a_m'] = 'yes'
default['openssh']['server']['use_dns'] = 'no'


##################################
# Apply restrictions to su command
default[:cespi_server_security][:restricted_su][:enabled] = true

##################################
# IPtables firewall configuration.

# Rules for different protocols
default[:cespi_server_security][:firewall][:fw_database][:allowed_networks][:networks] = %w(163.10.95.0/24)
default[:cespi_server_security][:firewall][:fw_database][:allowed_networks][:ports] = %w(3306)
default[:cespi_server_security][:firewall][:fw_http][:allowed_networks][:networks] = %w(0.0.0.0/0)
default[:cespi_server_security][:firewall][:fw_http][:allowed_networks][:ports] = %w(80 443)
default[:cespi_server_security][:firewall][:fw_ssh][:allowed_networks][:networks] = %w(163.10.5.192/26 163.10.95.30/32)
default[:cespi_server_security][:firewall][:fw_ssh][:allowed_networks][:ports] = %w(22)
# ICMP is special
default[:cespi_server_security][:firewall][:fw_icmp][:allowed_networks][:networks] = %w(0.0.0.0/0)
