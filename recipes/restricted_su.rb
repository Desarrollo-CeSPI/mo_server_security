file "/bin/su" do
  owner 'root'
  group node[:cespi_server_base][:authorization][:superadmin_group]
  mode '4750'
end
