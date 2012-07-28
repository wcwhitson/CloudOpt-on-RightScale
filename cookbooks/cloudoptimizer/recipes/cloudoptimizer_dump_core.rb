################################################################################
# cloudoptimizer_dump_core.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Cause cloudoptimizer to dump core and restart
################################################################################

rightscale_marker :begin

dump_core

rightscale_marker :end
