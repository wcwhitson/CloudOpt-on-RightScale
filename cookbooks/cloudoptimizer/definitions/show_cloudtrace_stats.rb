################################################################################
# show_cloudtrace_stats.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Shows cloudtrace stats show in the RightScale audit log
################################################################################

define :show_cloudtrace_stats do
  execute "cloudtrace stats" do
    command "cloudtrace stats show"
  end
end