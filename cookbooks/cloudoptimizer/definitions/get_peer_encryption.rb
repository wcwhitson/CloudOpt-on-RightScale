################################################################################
# get_peer_encryption.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer peer encryption
################################################################################

define :get_peer_encryption do
  execute "cloudconfig" do
    command "cloudconfig get /config/peer_encryption"
    returns [0, 1]
  end
end