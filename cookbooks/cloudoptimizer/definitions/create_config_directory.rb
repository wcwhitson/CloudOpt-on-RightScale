################################################################################
# create_config_directory.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Create the CloudOptimizer configuration directory in /etc.
################################################################################

define :create_config_directory do
  log "Creating default config directory (#{node[:cloudoptimizer][:config_dir]})."
  directory node[:cloudoptimizer][:config_dir] do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end
  log "Create config directory: Ending"
end