##########
# Fail2ban
default[:mo_server_security][:fail2ban][:enabled] = true
default[:mo_server_security][:fail2ban][:ignoreip] = "127.0.0.1/8"
default[:mo_server_security][:fail2ban][:findtime] = "600"
default[:mo_server_security][:fail2ban][:bantime] = "600"
default[:mo_server_security][:fail2ban][:maxretry] = "3"
default[:mo_server_security][:fail2ban][:destemail] = "user@domain"
# Specific services
default[:mo_server_security][:fail2ban][:ssh][:enabled] = true
default[:mo_server_security][:fail2ban][:ssh][:maxretry] = "5"
default[:mo_server_security][:fail2ban][:postfix][:enabled] = false
default[:mo_server_security][:fail2ban][:courierauth][:enabled] = false
default[:mo_server_security][:fail2ban][:sasl][:enabled] = false


######################################
# SSH service.

# Enable configuration of sshd service
default[:mo_server_security][:ssh_config][:enabled] = true
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
default['openssh']['server']['subsystem'] = "sftp /usr/lib/openssh/sftp-server"


##################################
# Apply restrictions to su command
default[:mo_server_security][:restricted_su][:enabled] = true

##################################
# IPtables firewall configuration.
default["simple_iptables"]["ipv4"]["tables"] = %w(filter)
default["simple_iptables"]["ipv6"]["tables"] = %w(filter)

###############################################################################
# Rules for different protocols
###############################################################################
# Mysql DB
default[:mo_server_security][:firewall][:fw_database][:allowed_networks][:networks] = %w(163.10.95.0/24)
default[:mo_server_security][:firewall][:fw_database][:allowed_networks][:ports] = %w(3306)
#HTTP
default[:mo_server_security][:firewall][:fw_http][:allowed_networks][:networks] = %w(0.0.0.0/0)
default[:mo_server_security][:firewall][:fw_http][:allowed_networks][:ports] = %w(80 443)
# SSH
default[:mo_server_security][:firewall][:fw_ssh][:allowed_networks][:networks] = %w(163.10.5.192/26 163.10.95.30/32)
default[:mo_server_security][:firewall][:fw_ssh][:allowed_networks][:ports] = %w(22)
#
# ICMP is special
default[:mo_server_security][:firewall][:fw_icmp][:allowed_networks][:networks] = %w(0.0.0.0/0)

# Elasticsearch
default[:mo_server_security][:firewall][:fw_elasticsearch][:allowed_networks][:networks] = %w(163.10.5.192/26 163.10.95.30/32)
default[:mo_server_security][:firewall][:fw_elasticsearch][:allowed_networks][:ports] = %w(9200)

