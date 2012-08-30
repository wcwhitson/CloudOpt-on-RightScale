################################################################################
# show_home_dir.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Shows contents of the home directory in the RightScale audit log
################################################################################

define :show_home_dir do
  execute "ls" do
    command "ls -lR #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}"
  end
end