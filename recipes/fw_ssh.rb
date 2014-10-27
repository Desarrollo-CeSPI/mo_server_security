simple_iptables_rule "ssh" do
  direction "INPUT"
  rule rule_for("ssh")
  jump "ACCEPT"
end
