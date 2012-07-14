################################################################################
# delete_peer.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Delete a peer from the CloudOptimizer configuration
################################################################################

define :delete_peer do
  if node[:cloudoptimizer_configuration][:peers][:peer_to_modify] != "None"
    execute "cloudconfig" do
      command "cloudconfig peer_delete node[:cloudoptimizer_configuration][:peers][:peer_to_modify]"
    end
  end
end