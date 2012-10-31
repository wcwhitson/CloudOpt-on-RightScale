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
#if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
#  add_cloudopt_test_repos
#else
#  add_cloudopt_repos
#end

# Install EPEL
# We seem to have a lot of problems with the EPEL repos that RightScale installs by
# default.  Installing the default repos makes those problems go away.
#if node[:platform] == 'centos'
#  if node[:platform_version] == '5.4' || node[:platform_version] == '5.6' || node[:platform_version] == '5.8'
#    log "Installing EPEL for CentOS 5.x"
#    execute "rpm" do
#      command "rpm -Uvh #{node[:cloudoptimizer][:defaults][:epel_5_repo]}"
#    end
#  elsif node[:platform_version] == '6.2' || node[:platform_version] == '6.3'
#    log "Installing EPEL for CentOS 6.x"
#    execute "rpm" do
#      command "rpm -Uvh #{node[:cloudoptimizer][:defaults][:epel_6_repo]}"
#    end
#  else
#    log "Not CentOS 5.x or 6.x, so not installing EPEL." 
#  end
#end

# Unlock collectd
# For reasons that aren't entirely clear, RightScale locks collectd in the repo spec.  When locked
# it is impossible to install the CloudOptimizer WebUI.
#log "Unlock collectd: removing the default RightScale lock on the collectd package."
#unlock_package "collectd" do
#  package_name "collectd"
#end

# Open firewall ports
#open_cloudoptimizer_ports

# Install compatible Python
# We can remove this when 1.1.5 goes out of support
#if node[:cloudoptimizer][:version] == '1.1.5'
#  if node[:platform_version] == '12.04'
#    log "Install python: Running an affected version on Ubuntu 12.04.  Installing Python 2.6 for compatibilty."
#    install_python26
#  else
#    log "Install python: Not running on Ubuntu 12.x.  Skipping Python 2.6 install."
#  end
#else
#  log "Install python: Not running on an affected version.  Skipping Python 2.6 install."
#end

# Create alternate home directory
#unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "node[:cloudoptimizer][:defaults][:home_dir]"
#  create_home_directory
#end

# Create alternate log directory
#unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "node[:cloudoptimizer][:defaults][:log_dir]"
#  create_log_directory
#end

# Install CloudOptimizer
#install_cloudoptimizer_package

# Install CloudController
# Install the cloudoptimizer-s3 package if the user chooses to install either CloudController or squid
#if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install' || node[:cloudoptimizer_configuration][:http_proxy] == 'true'
#  install_cloudcontroller_package
#  write_squid_template
#  if node[:cloudoptimizer_configuration][:http_proxy] == 'false'
#    stop_squid
#  else
#    stop_squid
#    start_squid
#  end
#end

# Install WebUI
#if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
#  install_cloudoptimizer_webui_package
#  if node[:cloudoptimizer][:web_interface][:webui_passwd] != 'disabled'
#    set_webui_password
#  end
#end

# Set transparent proxy defaults
#configure_transparent_proxy

# Configure log rotation
#configure_log_rotation

# Install RightScale compatible collectd-mysql
#log "Remove the default collectd-mysql package"
#package "collectd-mysql" do
#  action :remove
#end

#log "Install RightScale compatible collectd-mysql package"
#execute "rpm" do
#  command "rpm --nodeps -Uvh #{node[:cloudoptimizer][:defaults][:compatible_collectd_mysql]}"
#end

# Either install a stored config or build config from template and inputs
#if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
#  write_configuration_template
#else
#  get_configuration_stored
#end

# Restart to pick up config
#restart_cloudoptimizer

rightscale_marker :end
