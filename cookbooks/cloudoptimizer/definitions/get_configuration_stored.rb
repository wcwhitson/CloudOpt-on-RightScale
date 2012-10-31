################################################################################
# get_configuration_stored.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Here we give the user the option to retrieve stored configuration files for a 
# truly persistent CloudOptimizer installation that can be stopped and started 
# without requiring reconfiguration.  Files must be provided on an unprotected 
# HTTP server.
#
# Stored configuration files take precedence over all other configuration.  
# Thus, if the user sets individual configuration options, but also specifies a 
# stored config file, the individual configuration options will be ignored.
################################################################################

define :get_configuration_stored do
  log "Stored configs: Starting"
  log "Stored configs: Installing saved cloudoptimizer configuration from: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
  remote_file "#{node[:cloudoptimizer][:defaults][:config_file_path]}/#{node[:cloudoptimizer][:defaults][:config_file_name]}" do
    source node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]
    owner "root"
    group "root"
    mode "0644"
  end
end