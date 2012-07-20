################################################################################
# fix_epel_repos.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# CloudOptimizer's WebUI depends on collectd and rrdtool.  RightScale also
# depends on these packages, but installs them from its own repo, which is not
# always up to date.  This causes unresolvable dependencies.  This script
# removes RightScale's EPEL repo and replaces it with the standard EPEL repo.
################################################################################

define :fix_epel_repos do
  log "Fix EPEL repos: Starting"
  # Delete the existing EPEL repo
  if node[:platform][:version] == '6.0' || node[:platform][:version] == '6.2'
    execute "mv" do
      command "mv /etc/yum.repos.d/Epel.repo /etc/cloudoptimizer/"
    end
    execute "mv" do
      command "mv /etc/yum.repos.d/RightScale-epel.repo /etc/cloudoptimizer/"
    end
    # Install the standard EPEL repo
    execute "rpm" do
      command "rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm"
    end
  else
    execute "mv" do
      command "mv /etc/yum.repos.d/Epel.repo /etc/cloudoptimizer/"
    end
    execute "mv" do
      command "mv /etc/yum.repos.d/RightScale-epel.repo /etc/cloudoptimizer/"
    end
    # Install the standard EPEL repo
    execute "rpm" do
      command "rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm"
    end
  log "Fix EPEL repos: Ending"
end