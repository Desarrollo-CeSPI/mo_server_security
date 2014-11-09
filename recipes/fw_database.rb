include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "database" do
  direction "INPUT"
  rule rule_for("database")
  jump "ACCEPT"
end
