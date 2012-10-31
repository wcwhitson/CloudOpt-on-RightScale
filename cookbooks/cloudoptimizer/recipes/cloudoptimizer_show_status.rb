################################################################################
# cloudoptimizer_show_status.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Display CloudOptimizer status in the RightScale audit log
################################################################################

rightscale_marker :begin

log "--------------------------------------------------------------"
log "CLOUDOPTIMIZER STATUS:"
show_cloudoptimizer_status
show_cloudoptimizer_webui_status
log "--------------------------------------------------------------"

rightscale_marker :end
