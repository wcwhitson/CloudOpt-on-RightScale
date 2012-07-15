################################################################################
# unfix_epel_repos.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Restore RightScale custom EPEL repos
################################################################################

define :unfix_epel_repos do
  log "Unfix EPEL repos: Starting"
  # Delete the existing EPEL repo
  execute "mv" do
    command "mv /etc/cloudoptimizer/Epel.repo /etc/yum.repos.d/"
  end
  execute "mv" do
    command "mv  /etc/cloudoptimizer/RightScale-epel.repo /etc/yum.repos.d/"
  end
  # Install the standard EPEL repo
  execute "rpm" do
    command "rpm -e epel-release-5-4.noarch"
  end
  log "Unfix EPEL repos: Ending"
end