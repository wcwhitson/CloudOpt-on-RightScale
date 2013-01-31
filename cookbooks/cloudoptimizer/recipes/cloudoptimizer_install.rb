################################################################################
# cloudoptimizer_install.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# First time installation and configuration of CloudOptimizer
################################################################################

rightscale_marker :begin

# User feedback
# collect configuration data unless disabled by the user
user_feedback

remote_file "/var/tmp/cloudoptimizer-install.tar.gz" do
  source "http://#{node[:cloudoptimizer][:defaults][:download_site]}/#{node[:cloudoptimizer][:defaults][:installer]}"
  owner "root"
  group "root"
  mode "0755"
end

log "Unpacking CloudOptimizer installer"
execute "tar" do
  command "tar -C /var/tmp -pzxvf /var/tmp/cloudoptimizer-install.tar.gz"
end

# Unlock collectd
# For reasons that aren't entirely clear, RightScale locks collectd in the repo spec.  When locked
# it is impossible to install the CloudOptimizer WebUI.
log "Unlock collectd: removing the default RightScale lock on the collectd package."
unlock_package "collectd" do
  package_name "collectd"
end

# Open firewall ports
open_cloudoptimizer_ports

# Create alternate home directory
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == node[:cloudoptimizer][:defaults][:home_dir]
  install_arg1 = "--home_dir #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}"
end

# Create alternate log directory
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == node[:cloudoptimizer][:defaults][:log_dir]
  install_arg2 = "--log_dir #{node[:cloudoptimizer_configuration][:logs][:log_directory]}"
end

# Install WebUI
if node[:cloudoptimizer][:web_interface][:webui_passwd] != 'disabled'
  install_arg3 = "--password #{node[:cloudoptimizer][:web_interface][:webui_passwd]}"
end

# Install test or beta build
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  install_arg4 = "--testing"
end

# Install cloudoptimizer
# Run the install script
log "Running CloudOptimizer install script"
bash "cloudoptimizer-install.sh" do
  /var/tmp/cloudoptimizer-install.sh --auto --quiet install_arg1 install_arg2 install_arg3 install_arg4
end

# Install CloudController
# Install the cloudoptimizer-s3 package if the user chooses to install either CloudController or squid
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install' || node[:cloudoptimizer_configuration][:http_proxy] == 'true'
  install_cloudcontroller_package
  write_squid_template
  if node[:cloudoptimizer_configuration][:http_proxy] == 'false'
    stop_squid
  else
    stop_squid
    start_squid
  end
end

# Set transparent proxy defaults
configure_transparent_proxy

# Configure log rotation
configure_log_rotation

# Install RightScale compatible collectd-mysql
log "Remove the default collectd-mysql package"
package "collectd-mysql" do
  action :remove
end

log "Install RightScale compatible collectd-mysql package"
execute "rpm" do
  command "rpm --nodeps -Uvh #{node[:cloudoptimizer][:defaults][:compatible_collectd_mysql]}"
end

# Either install a stored config or build config from template and inputs
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  write_configuration_template
else
  get_configuration_stored
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
