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
          when "#{node[:cloudoptimizer][:current_version]}"
            case node[:languages][:ruby][:host_cpu]
            when "x86_64"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:current_version]}"
                  action :install
                end
              when "i686"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:current_version]}"
                  action :install
                end
            end
          when "#{node[:cloudoptimizer][:previous_version_1]}"
            case node[:languages][:ruby][:host_cpu]
              when "x86_64"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_1]}"
                  action :install
                end
              when "i686"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_1]}"
                  action :install
                end
            end
          when "#{node[:cloudoptimizer][:previous_version_2]}"
            case node[:languages][:ruby][:host_cpu]
              when "x86_64"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_2]}"
                  action :install
                end
              when "i686"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_2]}"
                  action :install
                end
            end
          when "#{node[:cloudoptimizer][:previous_version_3]}"
            case node[:languages][:ruby][:host_cpu]
              when "x86_64"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_3]}"
                  action :install
                end
              when "i686"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_3]}"
                  action :install
                end
            end
          when "#{node[:cloudoptimizer][:previous_version_4]}"
            case node[:languages][:ruby][:host_cpu]
              when "x86_64"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_4]}"
                  action :install
                end
              when "i686"
                package "cloudoptimizer" do
                  version "#{node[:cloudoptimizer][:previous_version_4]}"
                  action :install
                end
            end
        end
      end
  when "centos"
    if node[:platform_version] == '6.2' || node[:platform_version] == '6.3'
      log "Installing fake python26 package for CentOS 6.x compatibility."
      cookbook_file "/var/tmp/fakepy-1-1.rpm" do
       source "fakepy-1-1.rpm"
       mode 0755
       owner "root"
       group "root"
      end
      execute "rpm" do
        command "rpm -i /var/tmp/fakepy-1-1.rpm"
      end
    end
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:current_version]}"
      execute "yum" do
        command "yum -y install cloudoptimizer"
      end
    else
      log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
      case node[:cloudoptimizer][:version] 
        when "#{node[:cloudoptimizer][:current_version]}"
          case node[:languages][:ruby][:host_cpu]
            when "x86_64"
              execute "yum" do
                command "yum -y install cloudoptimizer_#{node[:cloudoptimizer][:current_version]}"
              end
            when "i686"
              execute "yum" do
                command "yum -y install cloudoptimizer_#{node[:cloudoptimizer][:current_version]}"
              end
          end
        when "#{node[:cloudoptimizer][:previous_version_1]}"
          case node[:languages][:ruby][:host_cpu]
            when "x86_64"
              execute "yum" do
                command "yum -y install cloudoptimizer_#{node[:cloudoptimizer][:previous_version_1]}"
              end
            when "i686"
              execute "yum" do
                command "yum -y install cloudoptimizer_#{node[:cloudoptimizer][:previous_version_1]}"
              end
          end
        when "#{node[:cloudoptimizer][:previous_version_2]}"
          case node[:languages][:ruby][:host_cpu]
            when "x86_64"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_2]}"
              end
            when "i686"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_2]}"
              end
          end
        when "#{node[:cloudoptimizer][:previous_version_3]}"
          case node[:languages][:ruby][:host_cpu]
            when "x86_64"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_3]}"
              end
            when "i686"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_3]}"
              end
          end
        when "#{node[:cloudoptimizer][:previous_version_4]}"
          case node[:languages][:ruby][:host_cpu]
            when "x86_64"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_4]}"
              end
            when "i686"
              execute "yum" do
                command "yum -y install cloudoptimizer-#{node[:cloudoptimizer][:previous_version_4]}"
              end
          end
      end
    end
  end
  log "Install cloudoptimizer: Ending"
end
