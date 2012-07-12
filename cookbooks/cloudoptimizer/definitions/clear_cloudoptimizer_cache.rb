################################################################################
# clear_cloudoptimizer_cache.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Restarts the CloudOptimizer daemons
################################################################################

define :clear_cloudoptimizer_cache do
  log "Clear CloudOptimizer cache: Starting"
  execute "service" do
    command "service cloudoptimizer clear-cache"
  end
  log "Clear CloudOptimizer cache: Ending"
end

