################################################################################
# get_terminate_ssl.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer SSL termination
################################################################################

define :get_terminate_ssl do
  execute "cloudconfig" do
    command "cloudconfig get /config/terminate_ssl"
    returns [0, 1]
  end
end