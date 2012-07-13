################################################################################
# get_optimistic_deduplication.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer optimistic deduplication
################################################################################

define :get_optimistic_deduplication do
  execute "cloudconfig" do
    command "cloudconfig get /config/optimistic_deduplication"
    returns [0, 1]
  end
end