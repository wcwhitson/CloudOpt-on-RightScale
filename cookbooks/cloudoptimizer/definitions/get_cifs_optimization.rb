################################################################################
# get_cifs_optimization.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer CIFS optimization
################################################################################

define :get_cifs_optimization do
  execute "cloudconfig" do
    command "cloudconfig get /config/optimize_cifs"
    returns [0, 1]
  end
end