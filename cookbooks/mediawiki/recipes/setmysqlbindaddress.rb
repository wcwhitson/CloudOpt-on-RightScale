#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

# When using both lamp and mysql recipes, the bind_address can end up with an unpredictable setting.
# Use this script to set it back

rightscale_marker :begin

node[:db_mysql][:bind_address] = node[:cloud][:private_ips][0]
log "  LAMP set MySQL to listen on #{node[:db_mysql][:bind_address]}"

rightscale_marker :end
