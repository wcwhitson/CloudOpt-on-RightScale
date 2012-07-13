################################################################################
# clear_cloudopt_repos.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Clear any installed repos
################################################################################

define :clear_cloudopt_repos do
  log "Clear repos: Starting"
  case node[:platform]
    when "ubuntu"
      log "Clear repos: Removing Ubuntu/apt repos."
      execute "rm" do
        command "rm -f /etc/apt/sources.list.d/cloudopt*"
      end
    when "centos"
      log "Clear repos: Removing CentOS/yum repos."
      execute "rm" do
        command "rm -f /etc/yum.repos.d/cloudopt*"
      end
  end
  log "Clear repos: Ending"
end