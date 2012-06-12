#
# Cookbook Name: Restart CloudOptimizer Service
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

execute "service" do
  command "service cloudoptimizer restart"
end

rs_utils_marker :end
