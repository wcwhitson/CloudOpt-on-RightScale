################################################################################
# get_log_key.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer log key
################################################################################

define :get_log_key do
  execute "cloudconfig" do
    command "cloudconfig get /config/log_key"
    returns [0, 1]
  end
end