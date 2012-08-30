################################################################################
# get_version.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets CloudOptimizer version
################################################################################

define :get_version do
  execute "service" do
          command "service cloudoptimizer show-version"
  end
end