################################################################################
# get_thread_count.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer thread count
################################################################################

define :get_thread_count do
  execute "cloudconfig" do
    command "cloudconfig get /config/thread_count"
    returns [0, 1]
  end
end