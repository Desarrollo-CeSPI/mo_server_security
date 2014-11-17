include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "elasticsearch" do
  direction "INPUT"
  rule rule_for("elasticsearch")
  jump "ACCEPT"
end
