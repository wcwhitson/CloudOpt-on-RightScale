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

# Currently set to perform a restart instead of reload, as reload returns an
# exit status of 1 on success.

define :reload_cloudoptimizer do
  log "Reload CloudOptimizer: Starting"
  restart_cloudoptimizer
#  execute "service" do
#    command "service cloudoptimizer reload"
#  end
  log "Reload CloudOptimizer: Ending"
end