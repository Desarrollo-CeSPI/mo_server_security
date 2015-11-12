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
default[:mo_server_security][:firewall][:fw_database][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_database][:allowed_networks][:ports] = %w(3306)
#HTTP
default[:mo_server_security][:firewall][:fw_http][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_http][:allowed_networks][:ports] = %w(80 443)
# SSH
default[:mo_server_security][:firewall][:fw_ssh][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_ssh][:allowed_networks][:ports] = %w(22)
#
# ICMP is special
default[:mo_server_security][:firewall][:fw_icmp][:allowed_networks][:networks] = []

# Elasticsearch
default[:mo_server_security][:firewall][:fw_elasticsearch][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_elasticsearch][:allowed_networks][:ports] = %w(9200)

# Redis
default[:mo_server_security][:firewall][:fw_redis][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_redis][:allowed_networks][:ports] = %w(6379)

# NRPE (Nagios)
default[:mo_server_security][:firewall][:fw_nrpe][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_nrpe][:allowed_networks][:ports] = %w(5666)
# NSCA (Nagios)
default[:mo_server_security][:firewall][:fw_nsca][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_nsca][:allowed_networks][:ports] = %w(5667)

# NFS
default[:mo_server_security][:firewall][:fw_nfs][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_nfs][:allowed_networks][:ports] = %w(111 2049)

# Carbon
default[:mo_server_security][:firewall][:fw_carbon][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_carbon][:allowed_networks][:ports] = %w(2003)

# Syslog
default[:mo_server_security][:firewall][:fw_syslog][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_syslog][:allowed_networks][:ports] = %w()

# OpenVPN
default[:mo_server_security][:firewall][:fw_vpn][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_vpn][:allowed_networks][:ports] = %w(1194)

# SMTP
default[:mo_server_security][:firewall][:fw_smtp][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_smtp][:allowed_networks][:ports] = %w(25)

# DNS
default[:mo_server_security][:firewall][:fw_dns][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_dns][:allowed_networks][:ports] = %w(53)

# NTP
default[:mo_server_security][:firewall][:fw_ntp][:allowed_networks][:networks] = []
default[:mo_server_security][:firewall][:fw_ntp][:allowed_networks][:ports] = %w(123)
