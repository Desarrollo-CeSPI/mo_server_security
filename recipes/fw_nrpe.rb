include_recipe "mo_server_security::_fw_basic"

monitoring_hosts = []
search(:node, "role:#{node['nrpe']['server_role']}") do |host|
  monitoring_hosts << host['ipaddress']
end

node.set[:mo_server_security][:firewall][:fw_nrpe][:allowed_networks][:networks] = monitoring_hosts

simple_iptables_rule "monitoring" do
  direction "INPUT"
  rule rule_for("nrpe")
  jump "ACCEPT"
end
