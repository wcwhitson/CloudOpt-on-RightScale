################################################################################
# show_cloudstats.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Shows cloudstats in the RightScale audit log
################################################################################

define :show_cloudstats do
  execute "cloudstats" do
    command "cloudstats"
  end
end