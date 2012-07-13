################################################################################
# restart_cloudoptimizer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Restarts the CloudOptimizer daemons
################################################################################

define :restart_cloudoptimizer do
  log "Restart CloudOptimizer: Starting"
  service "cloudoptimizer" do
    action :restart
  end
  log "Restart CloudOptimizer: Ending"
end