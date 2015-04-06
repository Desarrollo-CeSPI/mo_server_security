include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "redis" do
  direction "INPUT"
  rule rule_for("redis")
  jump "ACCEPT"
end
