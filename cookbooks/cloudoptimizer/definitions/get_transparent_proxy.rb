################################################################################
# get_transparent_proxy.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer transparent proxy
################################################################################

define :get_transparent_proxy do
  execute "cloudconfig" do
    command "cloudconfig get /config/source_transparency"
    returns [0, 1]
  end
end