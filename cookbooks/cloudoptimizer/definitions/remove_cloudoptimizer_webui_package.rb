################################################################################
# remove_cloudcontroller_webui_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the cloudoptimizer-webui package
################################################################################

define :remove_cloudoptimizer_webui_package do
  log "Remove cloudoptimizer-webui package: Starting"
  package "cloudoptimizer-webui" do
    action params[:name]
  end
  log "Remove cloudoptimizer-webui package: Ending"
end