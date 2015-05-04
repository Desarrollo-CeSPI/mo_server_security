include_recipe "mo_server_security::_fw_basic"

monitoring_hosts = []
search(:node, "role:#{node['nrpe']['server_role']}") do |host|
  monitoring_hosts << host['ipaddress']
end

simple_iptables_rule "monitoring" do
  direction "INPUT"
  rule all_from(monitoring_hosts)
  jump "ACCEPT"
end
