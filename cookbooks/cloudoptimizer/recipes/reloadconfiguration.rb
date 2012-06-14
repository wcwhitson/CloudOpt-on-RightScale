##
# Cookbook Name: Reload CloudOptimizer Configuration
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

execute "service" do
  command "service cloudoptimizer reload"
end

rs_utils_marker :end
