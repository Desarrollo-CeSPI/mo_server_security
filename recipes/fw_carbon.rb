include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "carbon" do
  direction "INPUT"
  rule rule_for("carbon","tcp","udp")
  jump "ACCEPT"
end
