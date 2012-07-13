################################################################################
# create_home_directory.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# If the user has specified a different home directory than the default, create
# the directory and set ownership and permissions.
################################################################################

define :create_home_directory do
  log "Create home: Starting"
  log "Create home: Creating CloudOptimizer home directory at #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}."
  directory node[:cloudoptimizer_configuration][:file_locations][:home_directory] do
    owner "cloudoptimizer"
    group "cloudoptimizer"
    mode "0711"
    action :create
  end
  if self.recipe_name == "cloudoptimizer_install"
    log "Create home: Deleting old home directory, as this is initial configuration."
    directory "/home/cloudoptimizer" do
      recursive true
      action :delete
    end
  else
    log "Create home: Keeping old home directory, as this is not initial configuration."
  end
  log "Create home: Ending"
end