################################################################################
# cloudoptimizer_cloudtrace_stats.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Displays cloudtrace stats show output in the RightScale audit log
################################################################################

rightscale_marker :begin

show_cloudtrace_stats

rightscale_marker :end
