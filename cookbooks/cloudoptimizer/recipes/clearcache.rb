#
# Cookbook Name: Clear CloudOptimizer Cache
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning Clear CloudOptimizer Cache  =========="

execute "service" do
  command "service cloudoptimizer clear-cache"
end

log "========== Ending Clear CloudOptimizer Cache  =========="
