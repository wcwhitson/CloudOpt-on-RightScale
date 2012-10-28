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

# User feedback
# collect configuration data unless disabled by the user
user_feedback

# Fix syslog-ng
# required on CloudOptimizer versions up to 0.9.4 - can be removed after 10/31/2012
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
# this is used to install the credentials on the instance for easy use with CloudController.
unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  install_aws_access_key
end
unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  install_aws_secret_key
end

# Add a cache volume
# Currently unused
#if node[:cloudoptimizer_configuration][:byte_cache][:ebs_volume_size] != '0'
#  add_cache_volume
#end

# Add CloudOpt repos
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  add_cloudopt_test_repos
else
  add_cloudopt_repos
end
# Install EPEL
# We seem to have a lot of problems with the EPEL repos that RightScale installs by
# default.  Installing the default repos makes those problems go away.
if node[:platform] == 'centos'
  if node[:platform_version] == '5.4' || node[:platform_version] == '5.6' || node[:platform_version] == '5.8'
    log "Installing EPEL for CentOS 5.x"
    execute "rpm" do
      command "rpm -Uvh http://mirrors.servercentral.net/fedora/epel/5/i386/epel-release-5-4.noarch.rpm"
    end
  elsif node[:platform_version] == '6.2' || node[:platform_version] == '6.3'
    log "Installing EPEL for CentOS 6.x"
    execute "rpm" do
      command "rpm -Uvh http://fedora-epel.mirror.lstn.net/6/i386/epel-release-6-7.noarch.rpm"
    end
  else
    log "Not CentOS 5.x or 6.x, so not installing EPEL." 
  end
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

# Install RightScale compatible collectd-mysql
package "collectd-mysql" do
  action :remove
end
  
execute "rpm" do
  command "rpm --nodeps -Uvh ftp://ftp.sunet.se/pub/Linux/distributions/fedora/epel/epel/5/x86_64/collectd-mysql-4.10.0-4.el5.x86_64.rpm"
end

lock_package "collectd-mysql" do
  package_name "collectd-mysql"
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
