# Cookbook: cespi_server_security

This cookbook provides some recipes to secure servers.

## Recipes

### Firewall

If any recipe is called, the DROP policy will be applied. That means that if, for example, fw_http recipe is added to the run_list and not fw_ssh SSH access to the server will be blocked.

## Supported Platforms

## Attributes

## Usage

## License and Authors

* Author:: Christian Rodriguez (<car@cespi.unlp.edu.ar>)
* Author:: Leandro Di Tommaso (<lditommaso@cespi.unlp.edu.ar>)
