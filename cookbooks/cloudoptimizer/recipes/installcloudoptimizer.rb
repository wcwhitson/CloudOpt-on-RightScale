#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

require "cloudoptcommon.rb"

# Send feedback
mail_feedback_start

# Install AWS Keys
#
# If the user chooses to provide their AWS credentials, we can pick them up for use
# with CloudController.  This is less secure than entering the credentials directly
# into CloudController, since the credentials are not encrypted.
unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  install_aws_access_key
end
unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  install_aws_secret_key
end

# Prepare EULA Acceptance
make_default_config_dir
accept_eula

# Install rsyslog.
install_rsyslog

# Set up CloudOpt repository
#
# CloudOpt runs on both Ubuntu and CentOS linux, which require different repositories.  Here we detect
# the linux distribution and then install the appropriate repository.
log "Installing CloudOpt software repository."
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  case node[:platform]
  when "ubuntu"
    install_repo_test_ubuntu
  when "centos"
    install_repo_test_centos
  end
else
  case node[:platform]
  when "ubuntu"
    install_repo_ubuntu
  when "centos"
    install_repo_centos
  end
end

# Set up firewall rules
install_firewall_rules

# Install CloudOptimizer
install_cloudoptimizer

# Create alternate home directory
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  create_alternate_home_dir
end

# Create alternate log directory
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  create_alternate_log_dir
end

# Install additional packages

# Install the CloudController package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  install_cloudcontroller
end

# Install the cloudoptimizer-tools package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
  install_cloudoptimizer_tools
end

# Install the CloudOptimizer stats GUI
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  install_webui
end

# Install vtun to support tunneling traffic to CloudOptimizer for interception
if node[:cloudoptimizer_packages][:optional][:vtun] == 'Install'
  install_vtun
end

# Install the frox package to proxy regular FTP
if node[:cloudoptimizer_packages][:optional][:frox] == 'Install'
  install_frox
end

# Install mysql-proxy for the MySQL interception solution
if node[:cloudoptimizer_packages][:optional][:mysql_proxy] == 'Install'
  install_mysql_proxy
end

# Here we set the public and private addresses to use when the transparent proxy is enabled.  By default, we use the
# first returned IP address for each, as there will generally be only one.  If the user has specified an address, we
# use that instead.

# Set the private/internal IP address
set_transparent_proxy_addresses

# We use chef templates to build the configuration file.  When new options are added to the configuration file, we must
# add a new template to match.  When multiple versions of the configuration file are supported at the same time, we must
# determine the CloudOptimizer version that we are installing and use the appropriate template for that version.

log "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1'
  use_config_template_093
elsif node[:cloudoptimizer][:version] == '0.9.4'
  use_config_template_094
else
  use_config_template_latest
end

# Install stored configurations

# Here we give the user the option to retrieve stored configuration files for a truly persistent CloudOptimizer
# installation that can be stopped and started without requiring reconfiguration.  Files must be provided on an
# unprotected HTTP server.

# Stored configuration files take precedence over all other configuration.  Thus, if the user sets individual
# configuration options, but also specifies a stored config file, the individual configuration options will be
# ignored.

# Stored CloudOptimizer configuration file
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  log "No stored cloudoptimizer configuration specified."
else
  install_stored_cloudoptimizer_config
end

# Stored vtun configuration file
if node[:cloudoptimizer][:stored_configuration][:vtun] == 'none'
  log "No stored vtun configuration specified."
else
  install_stored_vtun_config
end

# Reload the CloudOptimizer configuration.  This will put any changes into the running config and will 
# be harmless otherwise.
cloudoptimizer_init_restart

# Set up RightScale monitoring

rs_utils_monitor_process "cloudlicense"
rs_utils_monitor_process "cloudoptimizer"

mail_feedback_end

rs_utils_marker :end
