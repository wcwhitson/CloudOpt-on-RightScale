################################################################################
# cloudoptimizer_upgrade.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Upgrade the CloudOptimizer packages
################################################################################

rightscale_marker :begin

if node[:cloudoptimizer][:version] != 'latest'
  log "ERROR: The Version Lock input must be set to 'latest' in order to upgrade CloudOptimizer."
  exit
end
  
# Save the existing configuration
execute "mv" do
  command "mv /etc/cloudoptimizer.conf /var/tmp/cloudoptimizer.conf.pre-upgrade"
end

remote_file "/var/tmp/cloudoptimizer-install.tar.gz" do
  source "http://#{node[:cloudoptimizer][:defaults][:download_site]}/#{node[:cloudoptimizer][:defaults][:installer]}"
  owner "root"
  group "root"
  mode "0755"
end

log "Unpacking CloudOptimizer installer"
execute "tar" do
  command "tar -pzxvf /var/tmp/cloudoptimizer-install.tar.gz"
end

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
execute "cloudoptimizer-install.sh" do
  command "bash /var/tmp/cloudoptimizer-install.sh --auto --quiet #{install_arg1} #{install_arg2} #{install_arg3} #{install_arg4}"
end

if node[:platform] == 'centos'
  # Restore the RightScale custom EPEL repos
  unfix_epel_repos
end

# Restore the existing configuration
execute "mv" do
  command "mv /etc/cloudoptimizer.conf /etc/cloudoptimizer.conf.upgrade"
end
execute "mv" do
  command "mv /var/tmp/cloudoptimizer.conf.pre-upgrade /etc/cloudoptimizer.conf"
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
