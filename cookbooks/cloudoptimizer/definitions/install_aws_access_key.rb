################################################################################
# install_aws_access_key.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# If the user chooses to provide their AWS credentials, we can pick them up for
# use with CloudController.  This is less secure than entering the credentials 
# directly into CloudController, since the credentials are not encrypted.
################################################################################

define :install_aws_access_key do
  log "AWS Access Key: Starting"
  log "AWS Keys: Installing AWS access key in /root/aws_access_key."
  file "/root/aws_access_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
    action :create
  end
  log "AWS Access Key: Ending"
end