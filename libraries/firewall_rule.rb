def rule_for(protocol)
  recipe = "fw_#{protocol}".to_sym
  allowed_networks = node[:cespi_server_security][:firewall][recipe][:allowed_networks]
  allowed_networks.ports.map do |x|
    "-p tcp --dport #{x}"
  end.flat_map do
    |x| allowed_networks.networks.map {|y| "#{x} -s #{y}"}
  end
end

def rule_for_icmp
  node[:cespi_server_security][:firewall][:fw_icmp][:allowed_networks][:networks].map { |x| "-p icmp -s #{x}"}
end
