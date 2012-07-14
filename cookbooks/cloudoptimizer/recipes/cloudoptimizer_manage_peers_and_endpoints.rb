################################################################################
# cloudoptimizer_manage_peers_and_endpoints.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Add and remove peers and endpoints.  This script is used after initial
# configuration to build peer statements.
################################################################################

rightscale_marker :begin

case node[:cloudoptimizer_configuration][:peers][:peer_operation]
when "Add peer without endpoint"
  add_peer
when "Add peer with endpoint"
  add_peer
  add_endpoint
when "Add endpoint to peer"
  add_endpoint
when "Delete endpoint from peer"
  delete_endpoint
when "Delete peer"
  delete_peer
when "Clear all peers"
  clear_peers_and_endpoints
end

restart_cloudoptimizer

rightscale_marker :end
