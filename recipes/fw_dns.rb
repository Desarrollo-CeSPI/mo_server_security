include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "dns" do
  direction "INPUT"
  rule rule_for("dns", "tcp", "udp")
  jump "ACCEPT"
end
