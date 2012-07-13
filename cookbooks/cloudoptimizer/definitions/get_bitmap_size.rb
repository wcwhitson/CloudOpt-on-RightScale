################################################################################
# get_bitmap_size.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer bitmap size
################################################################################

define :get_bitmap_size do
  execute "cloudconfig" do
    command "cloudconfig get /config/bitmap_size"
    returns [0, 1]
  end
end