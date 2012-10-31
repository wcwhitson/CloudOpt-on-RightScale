################################################################################
# cloudoptimizer_add_mysql_master_as_peer.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Add a peer statement for the MySQL master database on the CloudOptimizer
# associated with the slave MySQL server.  This recipe should be run on every
# slave that will connect to the master.
#
# This recipe is a shortcut for adding peers with manage_peers_and_endpoints.
# More complex configurations, such as master-master replication, must use
# the conventional peer configuration recipes.
################################################################################

rightscale_marker :begin

execute "peer_add" do
  command "cloudconfig peer_add #{node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address]} #{node[:cloudoptimizer_mysql][:endpoints][:master_db_address]}"
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
