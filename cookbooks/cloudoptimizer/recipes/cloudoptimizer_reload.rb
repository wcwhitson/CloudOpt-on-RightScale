################################################################################
# cloudoptimizer_reload.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Reload CloudOptimizer configuration
################################################################################

rightscale_marker :begin

reload_cloudoptimizer

rightscale_marker :end
