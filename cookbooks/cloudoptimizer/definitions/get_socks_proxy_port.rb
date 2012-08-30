################################################################################
# get_socks_proxy_port.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SOCKS proxy port
################################################################################

define :get_socks_proxy_port do
  execute "cloudconfig" do
    command "cloudconfig get /config/socks_proxy_port"
    returns [0, 1]
  end
end