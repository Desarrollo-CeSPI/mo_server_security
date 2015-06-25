include_recipe "mo_server_security::_fw_basic"

simple_iptables_rule "monitoring_by_nsca" do
  direction "INPUT"
  rule rule_for("nsca")
  jump "ACCEPT"
end
