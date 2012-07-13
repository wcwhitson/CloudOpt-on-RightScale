################################################################################
# cloudoptimizer_clear_cache.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Clear the CloudOptimizer byte cache and restart the system daemons
################################################################################

rightscale_marker :begin

cloudoptimizer_clear_cache

rightscale_marker :end
