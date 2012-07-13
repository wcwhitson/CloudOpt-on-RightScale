################################################################################
# install_cloudoptimizer_webui_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install the cloudoptimizer-webui package if selected by input.  Starting in
# version 1.1.5, enable by default.
################################################################################

define :install_cloudoptimizer_webui_package do
  log "Install WebUI: Starting"
  log "Install WebUI: Installing cloudoptimizer-webui package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-webui"
    end
  else
    package "cloudoptimizer-webui"
  end
  log "Install WebUI: Ending"
end