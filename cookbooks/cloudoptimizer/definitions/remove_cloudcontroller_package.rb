################################################################################
# remove_cloudcontroller_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the cloudcontroller package
################################################################################

define :remove_cloudcontroller_package do
  log "Remove cloudcontroller package: Starting"
  package "cloudoptimizer-s3" do
    action params[:name]
  end
  log "Remove cloudcontroller package: Ending"
end