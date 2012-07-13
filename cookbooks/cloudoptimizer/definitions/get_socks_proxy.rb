################################################################################
# get_socks_proxy.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SOCKS proxy
################################################################################

define :get_socks_proxy do
  execute "cloudconfig" do
    command "cloudconfig get /config/enable_socks"
    returns [0, 1]
  end
end