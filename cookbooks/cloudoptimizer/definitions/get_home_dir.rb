################################################################################
# get_home_dir.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer home directory
################################################################################

define :get_home_dir do
  execute "cloudconfig" do
    command "cloudconfig get /config/home"
    returns [0, 1]
  end
end
  