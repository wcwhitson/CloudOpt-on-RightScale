################################################################################
# stop_squid.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Stops the squid daemons
################################################################################

define :stop_squid do
  log "Stop squid: Starting"
  service "squid" do
    action :stop
  end
  log "Stop squid: Ending"
end