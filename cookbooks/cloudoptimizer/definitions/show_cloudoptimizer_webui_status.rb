################################################################################
# show_cloudoptimizer_webui_status.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Shows service cloudoptimizer-webui status in the RightScale audit log
################################################################################

define :show_cloudoptimizer_webui_status do
  execute "service" do
    command "service cloudoptimizer-webui status"
  end
end