################################################################################
# stop_cloudoptimizer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Stops the CloudOptimizer daemons
################################################################################

define :stop_cloudoptimizer do
  log "Stop CloudOptimizer: Starting"
  service "cloudoptimizer" do
    action :stop
  end
  log "Stop CloudOptimizer: Ending"
end