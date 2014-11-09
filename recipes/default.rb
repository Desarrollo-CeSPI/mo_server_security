include_recipe "mo_server_security::fail2ban" if node.mo_server_security.fail2ban.enabled
include_recipe "mo_server_security::restricted_su" if node.mo_server_security.restricted_su.enabled
include_recipe "openssh" if node.mo_server_security.ssh_config.enabled
