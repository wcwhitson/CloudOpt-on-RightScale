################################################################################
# get_ssl_ca.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SSL CA certificate
################################################################################

define :get_ssl_ca do
  execute "cloudconfig" do
    command "cloudconfig get /config/ssl_ca"
    returns [0, 1]
  end
end