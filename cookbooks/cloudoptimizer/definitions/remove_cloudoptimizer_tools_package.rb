################################################################################
# remove_cloudoptimizer_tools_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the cloudoptimizer_tools package
################################################################################

define :remove_cloudoptimizer_tools_package do
  log "Remove cloudoptimizer_tools package: Starting"
  package "cloudoptimizer_tools" do
    action params[:name]
  end
  log "Remove cloudoptimizer_tools package: Ending"
end