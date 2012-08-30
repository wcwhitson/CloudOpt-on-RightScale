################################################################################
# get_verify_upstream_cert.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer verify upstream certificate
################################################################################

define :get_verify_upstream_cert do
  execute "cloudconfig" do
    command "cloudconfig get /config/verify_upstream_certificate"
    returns [0, 1]
  end
end