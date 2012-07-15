################################################################################
# cloudoptimizer_cloudstats.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Displays cloudstats output in the RightScale audit log
################################################################################

rightscale_marker :begin

show_cloudstats

rightscale_marker :end
