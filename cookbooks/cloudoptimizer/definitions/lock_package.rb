################################################################################
# lock_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Lock a package in a yum repository
################################################################################

define :lock_package do
  log "Lock a package: Starting"
  # Delete the existing EPEL repo
  if node[:platform] == 'centos'
    execute "echo" do
      command "echo \"exclude=#{params[:package_name]}\" >>/etc/yum.repos.d/epel.repo"
    end
  else
    log "Not CentOS"
  end
  log "Lock a package: Ending"
end