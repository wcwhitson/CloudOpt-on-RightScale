################################################################################
# reload_cloudoptimizer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Reloads the CloudOptimizer configuration
################################################################################

define :reload_cloudoptimizer do
  log "Reload CloudOptimizer: Starting"
  if node[:platform] == 'centos'
    # Currently set to perform a restart instead of reload, as reload returns an
    # exit status of 1 on success.  FB1381
    restart_cloudoptimizer
  else
    execute "service" do
      command "service cloudoptimizer reload"
    end
  end
  log "Reload CloudOptimizer: Ending"
end