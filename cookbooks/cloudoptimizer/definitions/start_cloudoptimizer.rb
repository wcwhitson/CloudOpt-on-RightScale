################################################################################
# start_cloudoptimizer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Starts the CloudOptimizer daemons
################################################################################

define :start_cloudoptimizer do
  log "Start CloudOptimizer: Starting"
  service "cloudoptimizer" do
    action :start
  end
  log "Start CloudOptimizer: Ending"
end