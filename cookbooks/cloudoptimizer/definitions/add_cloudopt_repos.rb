################################################################################
# add_cloudopt_repos.rb
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

define :add_cloudopt_repos do
  log "Add main repos: Starting"
  # First clear old CloudOpt repos, just in case
  clear_cloudopt_repos
  # Now install new repos
  case node[:platform]
    when "ubuntu"
      log "Repositories: Installing on Ubuntu; using apt repository."
      # Retrieve and install the repository list
      if node[:platform_version] == '12.04' || node[:platform_version] == '12.10'
        log "Repositories: Installing on Ubuntu 12.x"
        remote_file "/etc/apt/sources.list.d/cloudopt.precise.list" do
          source "http://#{node[:cloudoptimizer][:main_repo_ubuntu]}/cloudopt.precise.list"
        end
        elsif node[:platform_version] == '10.04'
          log "Repositories: Installing on Ubuntu < 12.x"
          remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
            source "http://#{node[:cloudoptimizer][:main_repo_ubuntu]}/cloudopt.maverick.list"
          end
        log "Repositories: Installing the Ubuntu archive repo."
        remote_file "/etc/apt/sources.list.d/cloudopt-rightscale.lucid.list" do
          source "http://#{node[:cloudoptimizer][:archive_repo_ubuntu]}/cloudopt-rightscale.lucid.list"
        end
        else
          log "This is not a supported version of Ubuntu.  Skipping repo installation."
      end

      # Retrieve the repository key file
      remote_file "/var/tmp/cloudopt.key.asc" do
        source "http://#{node[:cloudoptimizer][:main_repo_ubuntu]}/cloudopt.key.asc"
      end

      # Install the repository key file
      execute "apt-key" do
        command "apt-key add /var/tmp/cloudopt.key.asc"
      end

      # Update the apt database
      execute "apt-get" do
        command "apt-get update"
      end
    when "centos"
      if node[:platform_version] == '6.2' || node[:platform_version] == '6.3'
        log "Repositories: Installing on CentOS 6.x; using yum repository."
   
        # Retrieve the repository list
        remote_file "/var/tmp/CloudOpt.CentOS6.selfextracting" do
          source "https://#{node[:cloudoptimizer][:main_repo_centos]}/CloudOpt.CentOS6.selfextracting"
          mode "0755"
        end

        # Install the repository list
        execute "CloudOpt.CentOS6.selfextracting" do
          command "/var/tmp/CloudOpt.CentOS6.selfextracting"
        end
      elsif node[:platform_version] == '5.8'
        log "Repositories: Installing on CentOS 5.x; using yum repository."
   
        # Retrieve the repository list
        remote_file "/var/tmp/CloudOpt.selfextracting" do
          source "https://#{node[:cloudoptimizer][:main_repo_centos]}/CloudOpt.selfextracting"
          mode "0755"
        end

        # Install the repository list
        execute "CloudOpt.selfextracting" do
          command "/var/tmp/CloudOpt.selfextracting"
        end
      else
        log "This is not a supported version of CentOS.  Skipping repo installation."
      end
  end
  log "Add main repos: Ending"
end