################################################################################
# get_cache_size.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer cache size
################################################################################

define :get_cache_size do
  execute "cloudconfig" do
    command "cloudconfig get /config/default_cache_size"
    returns [0, 1]
  end
end