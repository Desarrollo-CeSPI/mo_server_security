include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "http" do
  direction "INPUT"
  rule rule_for("http")
  jump "ACCEPT"
end
