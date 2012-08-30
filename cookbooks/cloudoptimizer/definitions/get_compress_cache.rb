################################################################################
# get_compress_cache.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer compress cache
################################################################################

define :get_compress_cache do
  execute "cloudconfig" do
    command "cloudconfig get /config/compress_cache"
    returns [0, 1]
  end
end