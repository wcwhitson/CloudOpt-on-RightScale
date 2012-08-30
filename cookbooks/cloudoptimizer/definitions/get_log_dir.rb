################################################################################
# get_log_dir.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer log directory
################################################################################

define :get_log_dir do
  execute "cloudconfig" do
    command "cloudconfig get /config/log_dir"
    returns [0, 1]
  end
end