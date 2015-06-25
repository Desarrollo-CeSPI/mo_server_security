Array(node[:mo_server_base][:authorization][:superadmin_group]).each do |g|
  file "/bin/su" do
    owner 'root'
    group g
    mode '4750'
  end
end
