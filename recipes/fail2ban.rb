package "fail2ban"

service "fail2ban"

template "/etc/fail2ban/jail.conf" do
  source "jail.conf.erb"
	owner	"root"
	group "root"
	mode "0644"
	notifies "restart", "service[fail2ban]"
end
