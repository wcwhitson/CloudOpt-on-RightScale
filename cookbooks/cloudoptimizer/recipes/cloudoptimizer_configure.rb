################################################################################
# cloudoptimizer_configure.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# General purpose reconfiguration of CloudOptimizer.  This recipe is only used
# after initial configuration.  Primary configuration takes place in the
# cloudoptimizer_install recipe.
################################################################################

rightscale_marker :begin

# User feedback
# collect configuration data unless disabled by the user
user_feedback

# Add CloudOpt repos
# First clear existing repos in case we are changing to or from test or beta repos
clear_cloudopt_repos
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  add_cloudopt_test_repos
else
  add_cloudopt_repos
end

# Open firewall ports
open_cloudoptimizer_ports

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
