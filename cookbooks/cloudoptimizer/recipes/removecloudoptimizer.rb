#
# Cookbook Name: Remove CloudOptimizer
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Removal  =========="

case node[:cloudoptimizer_packages][:remove]
when "All Packages and Files"
  log "Removing all CloudOptimizer packages and files."
  package "cloudoptimizer" do
    action :purge
  end
when "All Packages (Retain Files)"
  log "Removing all CloudOptimizer packages, but retaining configuration."
  package "cloudoptimizer" do
    action :remove
  end
when "CloudController"
  log "Removing CloudController only."
  package "cloudoptimizer-s3" do
    action :remove
  end
when "Web GUI"
  log "Removing Stats GUI only."
  package "cloudoptimizer-stats" do
    action :remove
  end
end

log "========== Ending CloudOptimizer Removal  =========="

