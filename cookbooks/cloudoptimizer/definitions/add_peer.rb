################################################################################
# add_peer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Add a peer to the CloudOptimizer configuration
################################################################################

define :add_peer do
  if node[:cloudoptimizer_configuration][:peers][:peer_to_modify] != "None"
    execute "cloudconfig" do
      command "cloudconfig peer_add node[:cloudoptimizer_configuration][:peers][:peer_to_modify]"
    end
  end
end