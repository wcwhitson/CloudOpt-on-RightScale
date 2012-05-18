#
# Cookbook Name: Reload CloudOptimizer Configuration
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning Reload CloudOptimizer Configuration  =========="

execute "service" do
	command "service cloudoptimizer reload"
end

log "========== Ending Reload CloudOptimizer Configuration  =========="
