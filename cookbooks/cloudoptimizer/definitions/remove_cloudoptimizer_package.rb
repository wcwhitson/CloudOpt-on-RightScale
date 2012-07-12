################################################################################
# remove_cloudoptimizer_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the cloudoptimizer package
################################################################################

define :remove_cloudoptimizer_package do
  log "Remove cloudoptimizer package: Starting"
  package "cloudoptimizer" do
    action params[:name]
  end
  log "Remove cloudoptimizer package: Ending"
end