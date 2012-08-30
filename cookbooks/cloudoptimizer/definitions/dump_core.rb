################################################################################
# dump_core.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Cause CloudOptimizer to generate a core file
################################################################################

define :dump_core do
  execute "pkill" do
    command "pkill -USR1 cloudoptimizer"
  end
end