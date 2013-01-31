################################################################################
# get_cloudconfig.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Gets a setting from the configuration
################################################################################

define :get_cloudconfig do
  execute "cloudconfig" do
    command "cloudconfig get #{params[:setting]}"
    returns [0,1]
  end
end