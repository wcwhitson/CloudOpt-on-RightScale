################################################################################
# get_cache_promotion.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer cache promotion
################################################################################

define :get_cache_promotion do
  execute "cloudconfig" do
    command "cloudconfig get /config/cache_promotion"
    returns [0, 1]
  end
end