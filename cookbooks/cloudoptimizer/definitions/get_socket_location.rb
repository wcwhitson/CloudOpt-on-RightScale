################################################################################
# get_socket_location.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer socket file location
################################################################################

define :get_socket_location do
  execute "cloudconfig" do
    command "cloudconfig get /config/socket_location"
    returns [0, 1]
  end
end