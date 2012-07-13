################################################################################
# get_db_memory_size.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer db memory size
################################################################################

define :get_db_memory_size do
  execute "cloudconfig" do
    command "cloudconfig get /config/db_memory_size"
    returns [0, 1]
  end
end