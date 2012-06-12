#
# Cookbook Name: Clear CloudOptimizer Cache
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

execute "service" do
  command "service cloudoptimizer clear-cache"
end

rs_utils_marker :end
