################################################################################
# create_log_directory.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# If the user has specified a different log directory than the default, create
# the directory and set ownership and permissions.
################################################################################

define :create_log_directory do
  log "Create log dir: Starting"
  log "Create log dir: Creating input-specified CloudOptimizer log directory."
  directory node[:cloudoptimizer_configuration][:logs][:log_directory] do
    owner "root"
    group "root"
    mode "0700"
    action :create
  end
  if self.recipe_name == "cloudoptimizer_install"
    log "Create home: Deleting old log directory, as this is initial configuration."
    directory "/var/log/cloudoptimizer" do
      recursive true
      action :delete
    end
  else
    log "Create home: Keeping old log directory, as this is not initial configuration."
  end
  log "Create log dir: Ending"
end