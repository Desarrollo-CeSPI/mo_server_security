include_recipe "mo_server_security::_fw_basic"

ports = node.default['mo_server_security']['firewall']['fw_nfs']['allowed_networks'].to_hash['ports']

node['nfs']['port'].each do |name, port|
  ports << port.to_s
end


node.set['mo_server_security']['firewall']['fw_nfs']['allowed_networks']['ports'] = ports

simple_iptables_rule "nfs" do
  direction "INPUT"
  rule rule_for("nfs", "tcp", "udp")
  jump "ACCEPT"
end
