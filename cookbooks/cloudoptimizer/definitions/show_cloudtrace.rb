################################################################################
# show_cloudtrace.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Shows cloudtrace show in the RightScale audit log
################################################################################

define :show_cloudtrace do
  execute "cloudtrace" do
    command "cloudtrace show"
  end
end