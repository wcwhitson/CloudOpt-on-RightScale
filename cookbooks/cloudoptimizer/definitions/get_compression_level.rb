################################################################################
# get_compression_level.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer compression level
################################################################################

define :get_compression_level do
  execute "cloudconfig" do
    command "cloudconfig get /config/default_compression_level"
    returns [0, 1]
  end
end