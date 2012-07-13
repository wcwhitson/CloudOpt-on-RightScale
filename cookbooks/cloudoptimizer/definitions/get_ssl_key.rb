################################################################################
# get_ssl_key.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SSL key
################################################################################

define :get_ssl_key do
  execute "cloudconfig" do
    command "cloudconfig get /config/ssl_key"
    returns [0, 1]
  end
end