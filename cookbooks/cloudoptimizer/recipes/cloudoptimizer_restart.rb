################################################################################
# cloudoptimizer_restart.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Restart the CloudOptimizer daemons
################################################################################

rightscale_marker :begin

restart_cloudoptimizer

rightscale_marker :end
