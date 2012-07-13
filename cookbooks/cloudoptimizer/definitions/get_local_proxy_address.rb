################################################################################
# get_local_proxy_address.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer local proxy address
################################################################################

define :get_local_proxy_address do
  execute "cloudconfig" do
    command "cloudconfig get /config/local_proxy_address"
    returns [0, 1]
  end
end