#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.
#require 'rubygems'
#require 'pony'


rs_utils_marker :begin

# Install pony for mail support
g = gem_package "pony" do
  action :nothing
end
 
g.run_action(:install)
 
Gem.clear_paths
require 'pony'

#def send_info (mail_body)
#  mail_body.each do |item|
#    puts "#{item}<br>"
#  end
#end

# Provide automatic feedback to cloudopt
#if node[:cloudoptimizer][:automatic_feedback] == "Detailed feedback"
#  log "Sending detailed feedback."
#  mail_body == Array.new
#  mail_body << "Platform: #{node[:platform]}"
#  mail_body << "Version: #{node[:platform_version]}"
#  mail_body << "Uptime: #{node[:uptime]}"
#  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}"
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}"
#  mail_body << "Stored config: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
#  mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}"
#  mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}"
#  mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}"
#  mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}"
#  mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}"
#  mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}"
#  mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}"
#  mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}"
#  mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}"
#  mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}"
#  mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}"
#  mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}"
#  mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}"
#  mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}"
#  mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}"
#  mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}"
#  mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}"
#  mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}"
#  mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}"
#  mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}"
#  mail_body << "Peer statement: #{node[:cloudoptimizer_configuration][:peer_statement]}"
#  mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}"
#  mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}"
#  mail_body << "SOCKS username: #{node[:cloudoptimizer_configuration][:socks][:socks_username]}"
#  mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}"
#  mail_body << "Trans internal IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}"
#  mail_body << "Trans external IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - Start', :html_body => send_info(mail_body))
#elsif node[:cloudoptimizer][:automatic_feedback] == "Basic feedback"
#  log "Sending basic feedback."
#  mail_body == Array.new
#  mail_body << "Platform: #{node[:platform]}"
#  mail_body << "Version: #{node[:platform_version]}"
#  mail_body << "Uptime: #{node[:uptime]}"
#  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}"
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}"
#  mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}"
#  mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}"
#  mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}"
#  mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}"
#  mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}"
#  mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}"
#  mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}"
#  mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}"
#  mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}"
#  mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}"
#  mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}"
#  mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}"
#  mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}"
#  mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}"
#  mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}"
#  mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}"
#  mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}"
#  mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}"
#  mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}"
#  mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}"
#  mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}"
#  mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}"
#  mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - Start', :html_body => send_info(mail_body))
#else
#  log "Automatic feedback disabled."
#  mail_body == Array.new
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - Start', :html_body => send_info(mail_body))
#end

# Install AWS Keys

# If the user chooses to provide their AWS credentials, we can pick them up for use
# with CloudController.  This is less secure than entering the credentials directly
# into CloudController, since the credentials are not encrypted.

unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  file "/root/aws_access_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
    action :create
  end
end

unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  file "/root/aws_secret_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey]}"
    action :create
  end
end

# Prepare EULA Acceptance

log "Noting EULA acceptance."

# The CloudOptimizer package install script checks for the existence of /etc/cloudoptimizer/accept-eula.txt
# and, if it exists, does not present the EULA acceptance screen.  Here we create the file so that the
# RightScale automatic installation can proceed.  If the file does not exist when the installation script
# runs, the RightScale installation will hang.

# Create the /etc/cloudoptimizer directory, since it would not otherwise be created until the package
# installation script runs.
directory "/etc/cloudoptimizer" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

# Create the EULA acceptance file.  The content of the file doesn't matter, but we set it to
# "RS Accepted EULA" so that we can tell how it was generated.
# The file that the installation script checks changed in version 1.1.5, so for now, we just
# set both files.
# For 0.9.4 and earlier
file "/etc/cloudoptimizer/accept-eula.txt" do
  owner "root"
  group "root"
  mode "0755"
  content "RS Accepted EULA"
  action :create
end
# For 1.1.5 and later
file "/etc/cloudoptimizer/accepted-cloudoptimizer-eula" do
  owner "root"
  group "root"
  mode "0755"
  content "true"
  action :create
end

# Install rsyslog.  Under certain circumstances, syslog-ng has caused problems with CloudOptimizer.
# While those problems are solved at the time this comment was written, they have appeared as regressions
# several times.  Installing rsyslog is a risk mitigation measure.
log "Installing rsyslog for better compatibility with the installer."
package "rsyslog"

# Set up CloudOpt repository

log "Adding CloudOpt software repositories."

# CloudOpt runs on both Ubuntu and CentOS linux, which require different repositories.  Here we detect
# the linux distribution and then install the appropriate repository.
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  case node[:platform]
  when "ubuntu"
    log "Installing on Ubuntu; using apt repository."
    log "Installing the test repository.  CloudOpt internal use only."
    # Retrieve and install the repository list
    remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
      source "http://50.16.207.155/cloudopt-test.maverick.list"
    end

    # Retrieve the repository key file
    remote_file "/var/tmp/cloudopt.tc-key.asc" do
      source "http://50.16.207.155/cloudopt-test.gpg.key"
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
    log "Installing on CentOS; using yum repository."
    log "Installing the test repository.  CloudOpt internal use only."
    # Retrieve the repository list
    remote_file "/var/tmp/CloudOpt-Testing.selfextracting" do
      source "http://50.16.196.194/CloudOpt-Testing.selfextracting"
      mode "0755"
    end

    # Install the repository list
    execute "CloudOpt.selfextracting" do
      command "/var/tmp/CloudOpt-Testing.selfextracting"
    end
  end
else
  case node[:platform]
  when "ubuntu"
    log "Installing on Ubuntu; using apt repository."
    # Retrieve and install the repository list
    remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
      source "http://apt.cloudopt.com/cloudopt.maverick.list"
    end

    # Retrieve the repository key file
    remote_file "/var/tmp/cloudopt.key.asc" do
      source "http://apt.cloudopt.com/cloudopt.key.asc"
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
    log "Installing on CentOS; using yum repository."

    # Retrieve the repository list
    remote_file "/var/tmp/CloudOpt.selfextracting" do
      source "https://s3.amazonaws.com/rpm-cloudopt/CloudOpt.selfextracting"
      mode "0755"
    end

    # Install the repository list
    execute "CloudOpt.selfextracting" do
      command "/var/tmp/CloudOpt.selfextracting"
    end
  end
end

# Set up firewall rules

# This opens the CloudOptimizer ports in iptables.  This step is required for RackSpace instances and should
# do no harm on others.

log "Modifying firewall rules to allow CloudOptimizer ports."
if node[:sys_firewall][:enabled] == "enabled"
  include_recipe "iptables"
  sys_firewall "9001"
  sys_firewall "9002"
  sys_firewall "9003"
end

# Install CloudOptimizer

# Install and configure the CloudOptimizer packages.  This section must be updated for each new release.
# If not updated, the version lock input will not display new versions.  The RightScript will always
# install the latest version available when the version lock is set to "latest."

# The version locking is kind of a pain the way it is done, but chef doesn't appear to honor architecture
# in the package command as it should, at least on RightScale.  I wasted a lot of time trying to get it
# to work before settling on manually specifying the package options.  Thus, we have a lot of manual labor
# here to determine which package to install when version locking is selected.

if node[:cloudoptimizer][:version] == 'latest'
  log "Installing the latest cloudoptimizer package."
  package "cloudoptimizer"
else
  case node[:platform]
  when "ubuntu"
    case node[:cloudoptimizer][:version]
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
  when "centos"
    case node[:cloudoptimizer][:version] 
    when "1.1.5"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer_1.1.5"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer_1.1.5"
          end
        end
    when "0.9.4"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.4"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.4"
          end
      end
    when "0.9.3.2"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3.2"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3.2"
          end
        end
    when "0.9.3.1"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3.1"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3.1"
          end
        end
      end
    end
end

# Create alternate home directory

unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  directory node[:cloudoptimizer_configuration][:file_locations][:home_directory] do
    owner "cloudoptimizer"
    group "cloudoptimizer"
    mode "0711"
    action :create
  end
  directory "/home/cloudoptimizer" do
    recursive true
    action :delete
  end
end

# Create alternate log directory

unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  directory node[:cloudoptimizer_configuration][:logs][:log_directory] do
    owner "root"
    group "root"
    mode "0700"
    action :create
  end
  directory "/var/log/cloudoptimizer" do
    recursive true
    action :delete
  end
end

# Install additional packages

# Install the CloudController package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  package "cloudoptimizer-s3"
end

# Install the cloudoptimizer-tools package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
  package "cloudoptimizer-tools"
end

# Install the CloudOptimizer stats GUI
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  package "cloudoptimizer-webui"
end

# Install vtun to support tunneling traffic to CloudOptimizer for interception
if node[:cloudoptimizer_packages][:optional][:vtun] == 'Install'
  package "vtun"
end

# Install the frox package to proxy regular FTP
if node[:cloudoptimizer_packages][:optional][:frox] == 'Install'
  package "frox"
end

# Install mysql-proxy for the MySQL interception solution
if node[:cloudoptimizer_packages][:optional][:mysql_proxy] == 'Install'
  package "mysql-proxy"
end

# Here we set the public and private addresses to use when the transparent proxy is enabled.  By default, we use the
# first returned IP address for each, as there will generally be only one.  If the user has specified an address, we
# use that instead.

# Set the private/internal IP address
if node[:cloudoptimizer_configuration][:transparency][:transp_intip] == 'First private IP address'
  log "Setting internal IP address to #{node[:cloud][:private_ips][0]}"
  $internal_ip = node[:cloud][:private_ips][0]
else
  log "Setting internal IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}"
  $internal_ip = node[:cloudoptimizer_configuration][:transparency][:transp_intip]
end

# Set the public/external IP address
if node[:cloudoptimizer_configuration][:transparency][:transp_extip] == 'First public IP address'
  log "Setting external IP address to: #{node[:cloud][:public_ips][0]}"
  $external_ip = node[:cloud][:public_ips][0]
else
  log "Setting external IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}"
  $external_ip = node[:cloudoptimizer_configuration][:transparency][:transp_extip]
end  

# We use chef templates to build the configuration file.  When new options are added to the configuration file, we must
# add a new template to match.  When multiple versions of the configuration file are supported at the same time, we must
# determine the CloudOptimizer version that we are installing and use the appropriate template for that version.

log "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
# Use the template for CloudOptimizer versions 0.9.3.2 and earlier
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1'
  log "Using template cloudoptimizer.conf.0.9.3.erb."
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.0.9.3.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(
      :home_directory => node[:cloudoptimizer_configuration][:file_locations][:home_directory],
      :default_cache_size => node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size],
      :socket_location => node[:cloudoptimizer_configuration][:file_locations][:socket_location],
      :bitmap_size => node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size],
      :db_memory_size => node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size],
      :log_directory => node[:cloudoptimizer_configuration][:logs][:log_directory],
      :log_key => node[:cloudoptimizer_configuration][:logs][:log_key],
      :compression_engine => node[:cloudoptimizer_configuration][:compression][:compression_engine],
      :default_compression_level => node[:cloudoptimizer_configuration][:compression][:default_compression_level],
      :optimistic_deduplication => node[:cloudoptimizer_configuration][:optimistic_deduplication],
      :cache_promotion => node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion],
      :compress_cache => node[:cloudoptimizer_configuration][:byte_cache][:compress_cache],
      :thread_count => node[:cloudoptimizer_configuration][:thread_count],
      :intelligent_mesh => node[:cloudoptimizer_configuration][:intelligent_mesh],
      :local_proxy_address => node[:cloudoptimizer_configuration][:local_proxy_address],
      :peer_proxy_port => node[:cloudoptimizer_configuration][:peer_proxy_port],
      :peer_encryption => node[:cloudoptimizer_configuration][:encryption][:peer_encryption],
      :ssl_key => node[:cloudoptimizer_configuration][:encryption][:ssl_key],
      :ssl_cert => node[:cloudoptimizer_configuration][:encryption][:ssl_cert],
      :ssl_ca => node[:cloudoptimizer_configuration][:encryption][:ssl_ca],
      :peer_statement => node[:cloudoptimizer_configuration][:peer_statement]
    )
  end
# Use the template for version 0.9.4 and later
elsif node[:cloudoptimizer][:version] == '0.9.4'
  log "Using template cloudoptimizer.conf.0.9.4.erb."
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.0.9.4.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(
      :home_directory => node[:cloudoptimizer_configuration][:file_locations][:home_directory],
      :default_cache_size => node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size],
      :socket_location => node[:cloudoptimizer_configuration][:file_locations][:socket_location],
      :bitmap_size => node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size],
      :db_memory_size => node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size],
      :log_directory => node[:cloudoptimizer_configuration][:logs][:log_directory],
      :log_key => node[:cloudoptimizer_configuration][:logs][:log_key],
      :compression_engine => node[:cloudoptimizer_configuration][:compression][:compression_engine],
      :default_compression_level => node[:cloudoptimizer_configuration][:compression][:default_compression_level],
      :optimistic_deduplication => node[:cloudoptimizer_configuration][:optimistic_deduplication],
      :cache_promotion => node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion],
      :compress_cache => node[:cloudoptimizer_configuration][:byte_cache][:compress_cache],
      :thread_count => node[:cloudoptimizer_configuration][:thread_count],
      :intelligent_mesh => node[:cloudoptimizer_configuration][:intelligent_mesh],
      :local_proxy_address => node[:cloudoptimizer_configuration][:local_proxy_address],
      :peer_proxy_port => node[:cloudoptimizer_configuration][:peer_proxy_port],
      :peer_encryption => node[:cloudoptimizer_configuration][:encryption][:peer_encryption],
      :ssl_key => node[:cloudoptimizer_configuration][:encryption][:ssl_key],
      :ssl_cert => node[:cloudoptimizer_configuration][:encryption][:ssl_cert],
      :ssl_ca => node[:cloudoptimizer_configuration][:encryption][:ssl_ca],
      :peer_statement => node[:cloudoptimizer_configuration][:peer_statement],
      :socks_proxy => node[:cloudoptimizer_configuration][:socks][:socks_proxy],
      :socks_proxy_port => node[:cloudoptimizer_configuration][:socks][:socks_proxy_port],
      :socks_username => node[:cloudoptimizer_configuration][:socks][:socks_username],
      :source_transparency => node[:cloudoptimizer_configuration][:transparency][:source_transparency],
      :transp_int_ip => "$internal_ip",
      :transp_ext_ip => "$external_ip"
    )
  end
else
  log "Using template cloudoptimizer.conf.1.1.5.erb."
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.1.1.5.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(
      :home_directory => node[:cloudoptimizer_configuration][:file_locations][:home_directory],
      :default_cache_size => node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size],
      :socket_location => node[:cloudoptimizer_configuration][:file_locations][:socket_location],
      :bitmap_size => node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size],
      :db_memory_size => node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size],
      :log_directory => node[:cloudoptimizer_configuration][:logs][:log_directory],
      :log_key => node[:cloudoptimizer_configuration][:logs][:log_key],
      :compression_engine => node[:cloudoptimizer_configuration][:compression][:compression_engine],
      :default_compression_level => node[:cloudoptimizer_configuration][:compression][:default_compression_level],
      :optimistic_deduplication => node[:cloudoptimizer_configuration][:optimistic_deduplication],
      :cache_promotion => node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion],
      :compress_cache => node[:cloudoptimizer_configuration][:byte_cache][:compress_cache],
      :thread_count => node[:cloudoptimizer_configuration][:thread_count],
      :intelligent_mesh => node[:cloudoptimizer_configuration][:intelligent_mesh],
      :local_proxy_address => node[:cloudoptimizer_configuration][:local_proxy_address],
      :peer_proxy_port => node[:cloudoptimizer_configuration][:peer_proxy_port],
      :peer_encryption => node[:cloudoptimizer_configuration][:encryption][:peer_encryption],
      :ssl_key => node[:cloudoptimizer_configuration][:encryption][:ssl_key],
      :ssl_cert => node[:cloudoptimizer_configuration][:encryption][:ssl_cert],
      :ssl_ca => node[:cloudoptimizer_configuration][:encryption][:ssl_ca],
      :peer_statement => node[:cloudoptimizer_configuration][:peer_statement],
      :socks_proxy => node[:cloudoptimizer_configuration][:socks][:socks_proxy],
      :socks_proxy_port => node[:cloudoptimizer_configuration][:socks][:socks_proxy_port],
      :socks_username => node[:cloudoptimizer_configuration][:socks][:socks_username],
      :source_transparency => node[:cloudoptimizer_configuration][:transparency][:source_transparency],
      :transp_int_ip => "$internal_ip",
      :transp_ext_ip => "$external_ip",
      :cifs_optimization => node[:cloudoptimizer_configuration][:cifs][:optimize_cifs],
      :ssl_termination => node[:cloudoptimizer_configuration][:encryption][:ssl_termination],
      :upstream_verification => node[:cloudoptimizer_configuration][:encryption][:upstream_verification],
      :webui_login => node[:cloudoptimizer_configuration][:web_interface][:webui_login],
      :webui_passwd => node[:cloudoptimizer_configuration][:web_interface][:webui_passwd]
    )
  end
end

# Install stored configurations

# Here we give the user the option to retrieve stored configuration files for a truly persistent CloudOptimizer
# installation that can be stopped and started without requiring reconfiguration.  Files must be provided on an
# unprotected HTTP server.

# Stored configuration files take precedence over all other configuration.  Thus, if the user sets individual
# configuration options, but also specifies a stored config file, the individual configuration options will be
# ignored.

# Stored CloudOptimizer configuration file
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  log "No stored cloudoptimizer configuration specified."
else
  log "Installing saved cloudoptimizer configuration from: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
  remote_file "/etc/cloudoptimizer.conf" do
    source node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]
      owner "root"
      group "root"
      mode "0644"
    end
end

# Stored vtun configuration file
if node[:cloudoptimizer][:stored_configuration][:vtun] == 'none'
  log "No stored vtun configuration specified."
else
  log "Installing saved vtun configuration from: #{node[:cloudoptimizer][:stored_configuration][:vtun]}"
  remote_file "/etc/vtund.conf" do
    source node[:cloudoptimizer][:stored_configuration][:vtun]
    owner "root"
    group "root"
    mode "0644"
  end
end

# Reload the CloudOptimizer configuration.  This will put any changes into the running config and will 
# be harmless otherwise.

log "Restarting CloudOptimizer to pick up configuration changes."
service "cloudoptimizer" do
  action :restart
end

# Set up RightScale monitoring

rs_utils_monitor_process "cloudlicense"
rs_utils_monitor_process "cloudoptimizer"

# Provide automatic feedback to cloudopt
#if node[:cloudoptimizer][:automatic_feedback] == "Detailed feedback"
#  log "Sending detailed feedback."
#  mail_body == Array.new
#  mail_body << "Platform: #{node[:platform]}"
#  mail_body << "Version: #{node[:platform_version]}"
#  mail_body << "Uptime: #{node[:uptime]}"
#  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}"
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - End', :html_body => send_info(mail_body))
#elsif node[:cloudoptimizer][:automatic_feedback] == "Basic feedback"
#  log "Sending basic feedback."
#  mail_body == Array.new
#  mail_body << "Platform: #{node[:platform]}"
#  mail_body << "Version: #{node[:platform_version]}"
#  mail_body << "Uptime: #{node[:uptime]}"
#  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}"
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - End', :html_body => send_info(mail_body))
#else
#  log "Automatic feedback disabled."
#  mail_body == Array.new
#  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
#  Pony.mail(:to => 'bill@cloudopt.com', :subject => 'RightScale ServerTemplate Feedback - End', :html_body => send_info(mail_body))
#end

rs_utils_marker :end
