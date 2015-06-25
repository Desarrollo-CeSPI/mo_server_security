include_recipe "mo_server_security::_fw_basic"

servers = []
search(:node,'*:*').each {|x| servers << x.ipaddress }
node.set['mo_server_security']['firewall']['fw_syslog']['allowed_networks']['networks'] = servers.uniq
node.set['mo_server_security']['firewall']['fw_syslog']['allowed_networks']['ports']    = [ node['rsyslog']['port'] ]


simple_iptables_rule "syslog" do
  direction "INPUT"
  rule rule_for("syslog")
  jump "ACCEPT"
end
