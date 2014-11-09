include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "icmp" do
  direction "INPUT"
  rule rule_for_icmp
  jump "ACCEPT"
end
