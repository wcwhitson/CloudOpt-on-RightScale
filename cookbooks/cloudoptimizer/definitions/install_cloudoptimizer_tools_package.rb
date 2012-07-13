################################################################################
# install_cloudoptimizer_tools_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install the cloudoptimizer-tools package if selected by input.  This is not
# necessary on first install, but may be useful when cloudoptimizer-tools is
# updated separately from cloudoptimizer.
################################################################################

define :install_cloudoptimizer_tools_package do
  log "Install cloudoptimizer-tools: Starting"
  if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
    log "Install cloudoptimizer-tools: Installing cloudoptimizer-tools package."
    if node[:platform] == 'centos'
      execute "yum" do
        command "yum -y install cloudoptimizer-tools"
      end
    else
      package "cloudoptimizer-tools"
    end
  end
  log "Install cloudoptimizer-tools: Ending"
end