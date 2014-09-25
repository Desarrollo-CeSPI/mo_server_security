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
