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
  execute "service" do
    command "service cloudoptimizer reload"
  end
  log "Reload CloudOptimizer: Ending"
end