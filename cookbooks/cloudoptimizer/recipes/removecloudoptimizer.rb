#
# Cookbook Name: Remove CloudOptimizer
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

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
  log "Removing web interface only."
  package "cloudoptimizer-webui" do
    action :remove
  end
end

rs_utils_marker :end

