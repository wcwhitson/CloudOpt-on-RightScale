################################################################################
# get_compression_engine.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer
################################################################################

define :get_compression_engine do
  execute "cloudconfig" do
    command "cloudconfig get /config/compression_engine"
    returns [0, 1]
  end
end