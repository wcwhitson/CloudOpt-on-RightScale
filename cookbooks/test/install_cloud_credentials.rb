################################################################################
# install_cloud_credentials.rb
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

define :install_cloud_credentials do
  log "AWS Keys: Starting"
  unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
    log "AWS Keys: Installing AWS access key in /root/aws_access_key."
    file "/root/aws_access_key" do
      owner "root"
      group "root"
      mode "0700"
      content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
      action :create
    end
  end
  unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
    log "AWS Keys: Installing AWS secret key in /root/aws_secret_key."
    file "/root/aws_secret_key" do
      owner "root"
      group "root"
      mode "0700"
      content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey]}"
      action :create
    end
  end
  log "AWS Keys: Ending"
end