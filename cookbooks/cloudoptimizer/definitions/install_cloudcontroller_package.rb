################################################################################
# install_cloudcontroller_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install the cloudoptimizer-s3 package if selected by input
################################################################################

define :install_cloudcontroller_package do
  log "Install CloudController: Starting"
  if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
    log "Install CloudController: Installing cloudoptimizer-s3 package."
    if node[:platform] == 'centos'
      execute "yum" do
        command "yum -y install cloudoptimizer-s3"
      end
    else
      package "cloudoptimizer-s3"
    end
  end
  log "Install CloudController: Ending"
end