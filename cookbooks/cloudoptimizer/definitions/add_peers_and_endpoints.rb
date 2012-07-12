################################################################################
# add_peers_and_endpoints.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Add peers and/or endpoints to the saved configuration and reload the config.
################################################################################

define :add_peers_and_endpoints do
  if node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address] != "ignore"  && node[:cloudoptimizer_mysql][:endpoints][:master_db_address] != "ignore"
    node[:cloudoptimizer_configuration][:peer_statement] = "\"enabled\": [\"#{node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address]}\"], \"endpoints\": { \"#{node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address]}\": [\"#{node[:cloudoptimizer_mysql][:endpoints][:master_db_address]}\"] }"
  end

  reload_cloudoptimizer
end