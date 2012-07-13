################################################################################
# get_socks_proxy_username.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SOCKS proxy username
################################################################################

define :get_socks_proxy_username do
  execute "cloudconfig" do
    command "cloudconfig get /config/socks_username"
    returns [0, 1]
  end
end