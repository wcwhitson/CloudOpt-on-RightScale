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

require 'rubygems'

g = gem_package "right_aws" do
  action :nothing
end
g.run_action(:install)
Gem.clear_paths

# User feedback
user_feedback

# Fix syslog-ng
if node[:cloudoptimizer][:version] == '0.9.4' || node[:cloudoptimizer][:version] == '0.9.3.2' || node[:cloudoptimizer][:version] == '0.9.3.1'
  if File.exists?("/etc/syslog-ng/syslog-ng.conf")
    log "Fix syslog: syslog-ng is installed on CloudOptimizer version 0.9.4 or earlier; fixing config."
    fix_syslogng
  else
    log "Fix syslog: syslog-ng is not installed; nothing to do."
  end
else
  log "Fix syslog: Not running on an affected version.  Nothing to fix."
end

# Accept EULA
accept_eula

# Install Cloud Credentials
unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  install_aws_access_key
end
unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  install_aws_secret_key
end

# Add a cache volume
if node[:cloudoptimizer_configuration][:byte_cache][:ebs_volume_size] != '0'
  add_cache_volume
end

# Add CloudOpt repos
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  add_cloudopt_test_repos
else
  add_cloudopt_repos
end
#if node[:platform] == 'centos'
#  if node[:platform_version] == '5.4' || node[:platform_version] == '5.6' || node[:platform_version] == '5.8'
#    log "Installing EPEL for CentOS 5.x"
#    execute "rpm" do
#      command "rpm -Uvh http://mirrors.servercentral.net/fedora/epel/5/i386/epel-release-5-4.noarch.rpm"
#    end
#  elsif node[:platform_version] == '6.2'
#    log "Installing EPEL for CentOS 6.x"
#    execute "rpm" do
#      command "rpm -Uvh http://mirror.clarkson.edu/epel/6/i386/epel-release-6-7.noarch.rpm"
#    end
#  else
#    log "Not CentOS 5.x or 6.x, so not installing EPEL." 
#  end
#end

# Unlock collectd
# For reasons that aren't entirely clear, RightScale locks collectd in the repo spec.  When locked
# it is impossible to install the CloudOptimizer WebUI.
unlock_package "collectd" do
  package_name "collectd"
end

# Open firewall ports
open_cloudoptimizer_ports

# Install compatible Python
if node[:cloudoptimizer][:version] == '1.1.5' || node[:cloudoptimizer][:version] == '0.9.4' || node[:cloudoptimizer][:version] == '0.9.3.2'
  if node[:platform_version] == '12.04'
    log "Install python: Running an affected version on Ubuntu 12.04.  Installing Python 2.6 for compatibilty."
    install_python26
  else
    log "Install python: Not running on Ubuntu 12.x.  Skipping Python 2.6 install."
  end
else
  log "Install python: Not running on an affected version.  Skipping Python 2.6 install."
end

# Create alternate home directory
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  create_home_directory
end

# Create alternate log directory
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  create_log_directory
end

# Install CloudOptimizer
install_cloudoptimizer_package

# Install CloudController
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  install_cloudcontroller_package
  write_squid_template
  if node[:cloudoptimizer_configuration][:http_proxy] == 'false'
    stop_squid
  else
    stop_squid
    start_squid
  end
end

# Install WebUI
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  install_cloudoptimizer_webui_package
  if node[:cloudoptimizer][:web_interface][:webui_passwd] != 'disabled'
    set_webui_password
  end
end

# Set transparent proxy defaults
configure_transparent_proxy

# Configure log rotation
configure_log_rotation

# Either install a stored config or build config from template and inputs
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  write_configuration_template
else
  get_configuration_stored
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
