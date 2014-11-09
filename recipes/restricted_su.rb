file "/bin/su" do
  owner 'root'
  group node[:mo_server_base][:authorization][:superadmin_group]
  mode '4750'
end
