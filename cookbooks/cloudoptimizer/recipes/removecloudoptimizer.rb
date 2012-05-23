#
# Cookbook Name: Remove CloudOptimizer
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Removal  =========="

case node[:cloudoptimizer][:packages][:remove]
when "All Packages and Files"
  package "cloudoptimizer" do
    action :purge
  end
when "All Packages (Retain Files)"
  package "cloudoptimizer" do
    action :remove
  end
when "CloudController"
  package "cloudoptimizer-s3" do
    action :remove
  end
when "Web GUI"
  package "cloudoptimizer-stats" do
    action :remove
  end
end

log "========== Ending CloudOptimizer Removal  =========="

