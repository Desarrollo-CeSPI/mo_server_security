# Cookbook: mo_server_security

This cookbook provides some recipes to secure servers.

## Attributes

Attributes are specified in attributes/default.rb. Following, some are described.

The next two specify which tables to enable in both, IPv4 and IPv6. By default both are set to
filter because Proxmox containers does not have other tables enabled.

* **simple_iptables.ipv4.tables**: array with table names, defaults to %w(filter).
* **simple_iptables.ipv6.tables**: array with table names, defaults to %w(filter).

There are several attributes like the following for each recipe:
* **firewall.RECIPE_NAME.allowed_networks.networks**: array with networks, CIDR format.
* **firewall.RECIPE_NAME.allowed_networks.ports**: array with port numbers.

Where RECIPE_NAME is the name of the recipe is intended to customize. For example:
* **firewall.fw_database.allowed_networks.networks**: array with networks, CIDR format.
* **firewall.fw_database.allowed_networks.ports**: array with port numbers.

## Recipes

This recipes can be enabled/disabled/customized setting the appropiate attributes.

* **fail2ban**: installs and sets up Fail2Ban.
* **restricted_su**: disables su command for users not in the sysadmin group (specified in the mo_server_base
  recipe, via authorization.superadmin_group attribute.
* **ssh_config**: disables password authentication and permits root login using SSH public key only.

### Firewall

Firewall recipes must be called explicitely in the run list. There are several recipes for setting up the
firewall, which are:

* **_fw_basic**: sets **default policy to DROP**, accepts localhost, established and related connections.
  It is a hidden recipe and is not intended to be directly invoked.
* **fw_database.rb**: enables dataabse port from specified networks.
* **fw_http.rb**: enables HTTP port from specified networks.
* **fw_icmp.rb**: permits ICMP from specified networks, defaults to everywhere.
* **fw_ssh**: enables SSH port from specified networks.

Recipes above can be customized by setting the appropiate attributes.

**If any recipe is called, the _fw_basic recipe in invoked and so DROP INPUT policy will be applied**. That means that
if, for example, fw_http recipe is added to the run_list and not fw_ssh, SSH access to the server will be blocked.

## Usage

For general recipes, there are two ways of using this:

* Enabling them in the attributes and calling default recipe. This is the preferred way to do it.
* Directly invoking them in the run list.

For firewall recipes:

* Invoke them directly in the run list. Remember that when doing it, DROP policy in the INPUT will be applied.


## License and Authors

* Author:: Christian Rodriguez (<chrodriguez@gmail.com>)
* Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
