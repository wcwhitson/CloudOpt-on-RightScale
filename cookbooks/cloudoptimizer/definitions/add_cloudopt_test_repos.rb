################################################################################
# add_cloudopt_test_repos.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# CloudOpt runs on both Ubuntu and CentOS linux, which require different 
# repositories.  Detect the linux distribution and then install the appropriate 
# repository.
################################################################################

define :add_cloudopt_test_repos do
  log "Add test repos: Starting"
  case node[:platform]
    when "ubuntu"
      log "Repositories:Installing on Ubuntu; using apt repository."
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
      # Retrieve and install the repository list
      if node[:platform_version] == '12.04' || node[:platform_version] == '12.10'
        log "Repositories: Installing on Ubuntu 12.x"
        remote_file "/etc/apt/sources.list.d/cloudopt.precise.list" do
          source "http://#{node[:cloudoptimizer][:test_repo_ubuntu]}/cloudopt-test.precise.list"
        end
      else
        log "Repositories: Installing on Ubuntu < 12.x"
        remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
          source "http://#{node[:cloudoptimizer][:test_repo_ubuntu]}/cloudopt-test.maverick.list"
        end
      end
      # Retrieve the repository key file
      remote_file "/var/tmp/cloudopt.tc-key.asc" do
        source "http://#{node[:cloudoptimizer][:test_repo_ubuntu]}/cloudopt-test.gpg.key"
      end
      # Install the repository key file
      execute "apt-key" do
        command "apt-key add /var/tmp/cloudopt.tc-key.asc"
      end
      # Update the apt database
      execute "apt-get" do
        command "apt-get update"
      end
    when "centos"
      log "Repositories:Installing on CentOS; using yum repository."
      
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
      # Retrieve the repository list
      remote_file "/var/tmp/CloudOpt-Testing.selfextracting" do
        source "http://#{node[:cloudoptimizer][:test_repo_centos]}/CloudOpt-Testing.selfextracting"
        mode "0755"
      end

      # Install the repository list
      execute "CloudOpt.selfextracting" do
        command "/var/tmp/CloudOpt-Testing.selfextracting"
      end
  end
  log "Add test repos: Ending"
end