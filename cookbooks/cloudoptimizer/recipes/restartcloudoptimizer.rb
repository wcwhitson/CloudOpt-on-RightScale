#
# Cookbook Name: Restart CloudOptimizer Service
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning Restart CloudOptimizer Service  =========="

execute "service" do
	command "service cloudoptimizer restart"
end

log "========== Ending Restart CloudOptimizer Service  =========="
