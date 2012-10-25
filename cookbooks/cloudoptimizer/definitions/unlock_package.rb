################################################################################
# unlock_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Unlock a package that was previously designated as locked in a repository
# configuration file.
################################################################################

define :unlock_package do
  log "Unlock a package: Starting"
  # Delete the existing EPEL repo
  if node[:platform] == 'centos'
    execute "sed" do
      command "sed -e '/\/exclude=#{package}/s/^/#/' </etc/yum.repos.d/Epel.repo >/etc/yum.repos.d/Epel.repo"
    end
    #execute "awk" do
    #  command "awk \'match($0,\"exclude=collectd\") == 0 {print $0}\' /etc/yum.repos.d/Epel.repo > /etc/yum.repos.d/Epel.repo"
    #end
  else
    execute "mv" do
      command "mv /etc/apt/preferences.d/00rightscale /etc/cloudoptimizer/"
    end
  end
  log "Unlock a package: Ending"
end