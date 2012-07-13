################################################################################
# install_cloudoptimizer_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the CloudOptimizer packages.  This section must be 
# updated for each new release.  If not updated, the version lock input will not
# display new versions.  The RightScript will always install the latest version 
# available when the version lock is set to "latest."
################################################################################

define :install_cloudoptimizer_package do
log "Install cloudoptimizer: Starting"

  case node[:platform]
  when "ubuntu"
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:current_version]}"
      package "cloudoptimizer"
    else
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
      case node[:cloudoptimizer][:version]
      when "1.1.6"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "1.1.6"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "1.1.6"
              action :install
            end
        end
      when "1.1.5"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "1.1.5"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "1.1.5"
              action :install
            end
        end
      when "0.9.4"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.2-53"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "0.9.4-71"
              action :install
            end
        end
      when "0.9.3.2"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.2-53"
            action :install
          end
        when "i686"
          package "cloudoptimizer" do
            version "0.9.3.2-49"
            action :install
          end
      end
      when "0.9.3.1"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.1"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "0.9.3.1"
              action :install
            end
        end
      end
    end
  when "centos"
    # Install EPEL, since not every RightImage seems to have it installed
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:current_version]}"
      execute "yum" do
        command "yum -y install cloudoptimizer"
      end
    else
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
      case node[:cloudoptimizer][:version] 
      when "1.1.6"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.6"
            end
          when "i686"
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.6"
            end
          end
      when "1.1.5"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.5"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.5"
            end
          end
      when "0.9.4"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.4"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.4"
            end
        end
      when "0.9.3.2"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.2"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.2"
            end
          end
      when "0.9.3.1"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.1"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.1"
            end
        end
      end
    end
  end
log "Install cloudoptimizer: Ending"
end