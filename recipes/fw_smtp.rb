include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "smtp" do
  direction "INPUT"
  rule rule_for("smtp")
  jump "ACCEPT"
end
