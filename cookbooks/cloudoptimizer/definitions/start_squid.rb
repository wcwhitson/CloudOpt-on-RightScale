################################################################################
# start_squid.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Starts the squid daemons
################################################################################

define :start_squid do
  log "Start squid: Starting"
  service "squid" do
    action :start
  end
  log "Start squid: Ending"
end