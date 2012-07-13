################################################################################
# get_source_remap.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer source remap
################################################################################

define :get_source_remap do
  execute "cloudconfig" do
    command "cloudconfig get /config/source_remap"
    returns [0, 1]
  end
end