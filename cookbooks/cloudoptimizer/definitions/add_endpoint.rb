################################################################################
# add_endpoint.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Add an endpoint to the CloudOptimizer configuration
################################################################################

define :add_endpoint do
if node[:cloudoptimizer_configuration][:peers][:endpoint_to_modify] != "None" && node[:cloudoptimizer_configuration][:peers][:peer_to_modify] != "None"
    execute "cloudconfig" do
      command "cloudconfig peer_add node[:cloudoptimizer_configuration][:peers][:peer_to_modify] node[:cloudoptimizer_configuration][:peers][:peer_to_modify]"
    end
  end
end