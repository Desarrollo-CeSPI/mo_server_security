include_recipe "simple_iptables"

# Reject packets other than those explicitly allowed
simple_iptables_policy "INPUT" do
  policy "DROP"
end

# Accept all localhost connections
simple_iptables_rule "loopback" do
  direction "INPUT"
  rule "-i lo"
  jump "ACCEPT"
  weight 1
end

# Accept all established and related connections
simple_iptables_rule "established" do
  direction "INPUT"
  rule "-m state --state ESTABLISHED,RELATED"
  jump "ACCEPT"
  weight 1
end

# SSH access from everywhere to avoid problems with Chef Solo
if Chef::Config[:solo]
  errmsg = 'I am enabling SSH from everywhere to prevent connection problems with Chef Solo'
  Chef::Log.warn(errmsg)
  simple_iptables_rule "ssh-solo" do
    direction "INPUT"
    rule "-p tcp --dport 22"
    jump "ACCEPT"
  end
end
