################################################################################
# cloudoptimizer_remove.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the CloudOptimizer packages
################################################################################

rightscale_marker :begin

case node[:cloudoptimizer_packages][:remove]
when "All Packages and Files"
  log "Removing all CloudOptimizer packages and files."
  remove_cloudoptimizer_webui_package :purge
  remove_cloudcontroller_package :purge
  remove_cloudoptimizer_package :purge
  remove_cloudoptimizer_tools_package :purge  
  clear_cloudopt_repos
when "All Packages (Retain Files)"
  log "Removing all CloudOptimizer packages, but retaining configuration."
  remove_cloudoptimizer_webui_package :remove
  remove_cloudcontroller_package :remove
  remove_cloudoptimizer_package :remove
  remove_cloudoptimizer_tools_package :remove 
when "CloudController"
  log "Removing CloudController only."
  remove_cloudcontroller_package :remove
when "Web GUI"
  log "Removing web interface only."
  remove_cloudoptimizer_webui_package :remove
end

rightscale_marker :end

