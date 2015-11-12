include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "ntp" do
  direction "INPUT"
  rule rule_for("ntp")
  jump "ACCEPT"
end
