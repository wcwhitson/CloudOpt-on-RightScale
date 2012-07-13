################################################################################
# get_intelligent_mesh.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer intelligent mesh
################################################################################

define :get_intelligent_mesh do
  execute "cloudconfig" do
    command "cloudconfig get /config/intelligent_mesh"
    returns [0, 1]
  end
end