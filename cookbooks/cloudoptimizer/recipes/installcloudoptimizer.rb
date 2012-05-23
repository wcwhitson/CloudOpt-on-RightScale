#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Installation =========="

log "Test: #{ENV['RS_PUBLIC_IP']}"

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
file "/etc/cloudoptimizer/accept-eula.txt" do
  owner "root"
  group "root"
  mode "0755"
  content "RS Accepted EULA"
  action :create
end

# Set up CloudOpt repository

log "Adding CloudOpt software repositories."

# CloudOpt runs on both Ubuntu and CentOS linux, which require different repositories.  Here we detect
# the linux distribution and then install the appropriate repository.
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

  # Install rsyslog.  Under certain circumstances, syslog-ng has caused problems with CloudOptimizer.
  # While those problems are solved at the time this comment was written, they have appeared as regressions
  # several times.  Installing rsyslog is a risk mitigation measure.  This is necessary only on Ubuntu, as
  # CentOS uses rsyslog by default.  We may need to reconsider this step if we later provide the ability
  # to run this RightScript on top of an existing server instance.
  log "Installing rsyslog for better compatibility on Ubuntu."
  package "rsyslog"

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

# Here we install and configured the CloudOptimizer packages.  This section must be updated for each new
# release.  If not updated, the version lock input will not display new versions.  The RightScript will always
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
    when "0.9.4.1"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          package "cloudoptimizer" do
            version "0.9.4.1"
            action :install
          end
        when "i686"
          package "cloudoptimizer" do
            version "0.9.4.1"
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
    when "0.9.3"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          package "cloudoptimizer" do
            version "0.9.3-997"
            action :install
          end
        when "i686"
          package "cloudoptimizer" do
            version "0.9.3-906"
            action :install
          end
      end
    when "0.9.2.3"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          package "cloudoptimizer" do
            version "0.9.2.3"
            action :install
          end
        when "i686"
          package "cloudoptimizer" do
            version "0.9.2.3"
            action :install
          end
      end
  end
  when "centos"
    case node[:cloudoptimizer][:version] 
    when "0.9.4.1"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.4.1"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.4.1"
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
    when "0.9.3"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3"
          end	
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.3"
          end
        end
    when "0.9.2.3"
      case node[:languages][:ruby][:host_cpu]
        when "x86_64"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.2.3"
          end
        when "i686"
          execute "yum" do
            command "yum -y install cloudoptimizer-0.9.2.3"
          end
        end
      end
    end
end

# Install additional packages

# Install the CloudController package if selected
if node[:cloudoptimizer][:packages][:supplemental][:cloudoptimizers3] == 'Install'
  package "cloudoptimizer-s3"
end

# Install the cloudoptimizer-tools package if selected
if node[:cloudoptimizer][:packages][:supplemental][:cloudoptimizertools] == 'Install'
  package "cloudoptimizer-tools"
end

# Install the CloudOptimizer stats GUI
if node[:cloudoptimizer][:packages][:supplemental][:cloudoptimizerstat] == 'Install'
  package "cloudoptimizer-stat"
end

# Install vtun to support tunneling traffic to CloudOptimizer for interception
if node[:cloudoptimizer][:packages][:optional][:vtun] == 'Install'
  package "vtun"
end

# Install the frox package to proxy regular FTP
if node[:cloudoptimizer][:packages][:optional][:frox] == 'Install'
  package "frox"
end

# Install mysql-proxy for the MySQL interception solution
if node[:cloudoptimizer][:packages][:optional][:mysql_proxy] == 'Install'
  package "mysql-proxy"
end

# Here we set the public and private addresses to use when the transparent proxy is enabled.  By default, we use the
# first returned IP address for each, as there will generally be only one.  If the user has specified an address, we
# use that instead.

# Set the private/internal IP address
if node[:cloudoptimizer][:configuration][:transp_intip] == 'First private IP address'
  log "Setting internal IP address to #{node[:cloud][:private_ips][0]}"
  $internal_ip = node[:cloud][:private_ips][0]
else
  log "Setting internal IP address to user specified:"
  log node[:cloudoptimizer][:configuration][:transp_int_ip]
  $internal_ip = node[:cloudoptimizer][:configuration][:transp_intip]
end

# Set the public/external IP address
if node[:cloudoptimizer][:configuration][:transp_extip] == 'First public IP address'
  log "Setting external IP address to:"
  log node[:cloud][:public_ips][0]
  $external_ip = node[:cloud][:public_ips][0]
else
  log "Setting external IP address to user specified:"
  log node[:cloudoptimizer][:configuration][:transp_ext_ip]
  $external_ip = node[:cloudoptimizer][:configuration][:transp_extip]
end  

# We use chef templates to build the configuration file.  When new options are added to the configuration file, we must
# add a new template to match.  When multiple versions of the configuration file are supported at the same time, we must
# determine the CloudOptimizer version that we are installing and use the appropriate template for that version.

log node[:cloudoptimizer][:version]
# Use the template for CloudOptimizer versions 0.9.3.2 and earlier
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1' or node[:cloudoptimizer][:version] == '0.9.3' or node[:cloudoptimizer][:version] == '0.9.2.3'
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.0.9.3.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(
      :home_directory => node[:cloudoptimizer][:configuration][:home_directory],
      :default_cache_size => node[:cloudoptimizer][:configuration][:default_cache_size],
      :socket_location => node[:cloudoptimizer][:configuration][:socket_location],
      :bitmap_size => node[:cloudoptimizer][:configuration][:bitmap_size],
      :db_memory_size => node[:cloudoptimizer][:configuration][:db_memory_size],
      :log_directory => node[:cloudoptimizer][:configuration][:log_directory],
      :log_key => node[:cloudoptimizer][:configuration][:log_key],
      :compression_engine => node[:cloudoptimizer][:configuration][:compression_engine],
      :default_compression_level => node[:cloudoptimizer][:configuration][:default_compression_level],
      :optimistic_deduplication => node[:cloudoptimizer][:configuration][:optimistic_deduplication],
      :cache_promotion => node[:cloudoptimizer][:configuration][:cache_promotion],
      :compress_cache => node[:cloudoptimizer][:configuration][:compress_cache],
      :thread_count => node[:cloudoptimizer][:configuration][:thread_count],
      :intelligent_mesh => node[:cloudoptimizer][:configuration][:intelligent_mesh],
      :local_proxy_address => node[:cloudoptimizer][:configuration][:local_proxy_address],
      :peer_proxy_port => node[:cloudoptimizer][:configuration][:peer_proxy_port],
      :peer_encryption => node[:cloudoptimizer][:configuration][:peer_encryption],
      :ssl_key => node[:cloudoptimizer][:configuration][:ssl_key],
      :ssl_cert => node[:cloudoptimizer][:configuration][:ssl_cert],
      :ssl_ca => node[:cloudoptimizer][:configuration][:ssl_ca],
      :peer_statement => node[:cloudoptimizer][:configuration][:peer_statement]
    )
  end
# Use the template for version 0.9.4 and later
else
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.0.9.4.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(
      :home_directory => node[:cloudoptimizer][:configuration][:home_directory],
      :default_cache_size => node[:cloudoptimizer][:configuration][:default_cache_size],
      :socket_location => node[:cloudoptimizer][:configuration][:socket_location],
      :bitmap_size => node[:cloudoptimizer][:configuration][:bitmap_size],
      :db_memory_size => node[:cloudoptimizer][:configuration][:db_memory_size],
      :log_directory => node[:cloudoptimizer][:configuration][:log_directory],
      :log_key => node[:cloudoptimizer][:configuration][:log_key],
      :compression_engine => node[:cloudoptimizer][:configuration][:compression_engine],
      :default_compression_level => node[:cloudoptimizer][:configuration][:default_compression_level],
      :optimistic_deduplication => node[:cloudoptimizer][:configuration][:optimistic_deduplication],
      :cache_promotion => node[:cloudoptimizer][:configuration][:cache_promotion],
      :compress_cache => node[:cloudoptimizer][:configuration][:compress_cache],
      :thread_count => node[:cloudoptimizer][:configuration][:thread_count],
      :intelligent_mesh => node[:cloudoptimizer][:configuration][:intelligent_mesh],
      :local_proxy_address => node[:cloudoptimizer][:configuration][:local_proxy_address],
      :peer_proxy_port => node[:cloudoptimizer][:configuration][:peer_proxy_port],
      :socks_proxy => node[:cloudoptimizer][:configuration][:socks_proxy],
      :socks_proxy_port => node[:cloudoptimizer][:configuration][:socks_proxy_port],
      :socks_username => node[:cloudoptimizer][:configuration][:socks_username],
      :source_transparency => node[:cloudoptimizer][:configuration][:source_transparency], 
      :transp_int_ip => "$internal_ip",
      :transp_ext_ip => "$external_ip",
      :peer_encryption => node[:cloudoptimizer][:configuration][:peer_encryption],
      :ssl_key => node[:cloudoptimizer][:configuration][:ssl_key],
      :ssl_cert => node[:cloudoptimizer][:configuration][:ssl_cert],
      :ssl_ca => node[:cloudoptimizer][:configuration][:ssl_ca],
      :peer_statement => node[:cloudoptimizer][:configuration][:peer_statement]
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
if node[:cloudoptimizer][:stored][:cloudoptimizer] == 'none'
  log "No stored cloudoptimizer configuration specified."
else
  log "Installing saved cloudoptimizer configuration from:"
  log  node[:cloudoptimizer][:configuration][:stored][:cloudoptimizer]
  remote_file "/etc/cloudoptimizer.conf" do
    source node[:cloudoptimizer][:configuration][:stored][:cloudoptimizer]
      owner "root"
      group "root"
      mode "0644"
    end
end

# Stored vtun configuration file
if node[:cloudoptimizer][:stored][:vtun] == 'none'
  log "No stored vtun configuration specified."
else
  log "Installing saved vtun configuration from:"
  log node[:cloudoptimizer][:configuration][:stored][:vtun]
  remote_file "/etc/vtund.conf" do
    source node[:cloudoptimizer][:configuration][:stored][:vtun]
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

log "========== Ending CloudOptimizer Installation =========="
