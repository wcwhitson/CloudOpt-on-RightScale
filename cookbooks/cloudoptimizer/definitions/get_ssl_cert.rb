################################################################################
# get_ssl_cert.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SSL certificate
################################################################################

define :get_ssl_cert do
  execute "cloudconfig" do
    command "cloudconfig get /config/ssl_cert"
    returns [0, 1]
  end
end