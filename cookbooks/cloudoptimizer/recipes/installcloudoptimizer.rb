#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

rightscale_marker :begin

require 'rubygems'

g = gem_package "right_aws" do
  action :nothing
end
g.run_action(:install)
 
Gem.clear_paths

require 'right_aws'

################################################################################
# Send feedback
################################################################################
# Unless the user disables feedback, collect those configuration settings that
# don't reveal any customer-specific information and mail a report.
################################################################################
log "Feedback: Starting"
# Install pony for mail support
g = gem_package "pony" do
  action :nothing
end
g.run_action(:install)
 
Gem.clear_paths
require 'pony'

if node[:platform] == 'centos' && node[:platform_version] == '6.2'
  pony_args = ''
else
  pony_args = '-t'
end

# Provide automatic feedback to cloudopt
if node[:cloudoptimizer][:user_feedback] == "Detailed feedback"
  log "Feedback Sending detailed feedback."
  mail_body = Array.new
  mail_body << "Platform: #{node[:platform]}<br />"
  mail_body << "Version: #{node[:platform_version]}<br />"
  mail_body << "Uptime: #{node[:uptime]}<br />"
  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}<br />"
  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
  mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}<br />"
  mail_body << "Stored config: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}<br />"
  mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}<br />"
  mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}<br />"
  mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}<br />"
  mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}<br />"
  mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}<br />"
  mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}<br />"
  mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}<br />"
  mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}<br />"
  mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}<br />"
  mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}<br />"
  mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}<br />"
  mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}<br />"
  mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}<br />"
  mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}<br />"
  mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}<br />"
  mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}<br />"
  mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}<br />"
  mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}<br />"
  mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}<br />"
  mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}<br />"
  mail_body << "Peer statement: #{node[:cloudoptimizer_configuration][:peer_statement]}<br />"
  mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}<br />"
  mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}<br />"
  mail_body << "SOCKS username: #{node[:cloudoptimizer_configuration][:socks][:socks_username]}<br />"
  mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}<br />"
  mail_body << "Trans internal IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}<br />"
  mail_body << "Trans external IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}<br />"
  Pony.mail(
  :to => 'autofeedback@cloudopt.com',
  :subject => 'RightScale ServerTemplate Feedback (Detailed)',
  :headers => { 'Content-Type' => 'text/html' },
  :via_options => { :arguments => pony_args },
  :body => mail_body)
elsif node[:cloudoptimizer][:user_feedback] == "Basic feedback"
  log "Feedback: Sending basic feedback."
  mail_body = Array.new
  mail_body << "Platform: #{node[:platform]}<br />"
  mail_body << "Version: #{node[:platform_version]}<br />"
  mail_body << "Uptime: #{node[:uptime]}<br />"
  mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}<br />"
  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
  mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}<br />"
  mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}<br />"
  mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}<br />"
  mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}<br />"
  mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}<br />"
  mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}<br />"
  mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}<br />"
  mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}<br />"
  mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}<br />"
  mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}<br />"
  mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}<br />"
  mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}<br />"
  mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}<br />"
  mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}<br />"
  mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}<br />"
  mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}<br />"
  mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}<br />"
  mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}<br />"
  mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}<br />"
  mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}<br />"
  mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}<br />"
  mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}<br />"
  mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}<br />"
  mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}<br />"
  Pony.mail(
  :to => 'autofeedback@cloudopt.com',
  :subject => 'RightScale ServerTemplate Feedback (Basic)',
  :headers => { 'Content-Type' => 'text/html' },
  :via_options => { :arguments => pony_args },
  :body => mail_body)
else
  log "Feedback: Automatic feedback disabled."
  mail_body = Array.new
  mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
  Pony.mail(
  :to => 'autofeedback@cloudopt.com',
  :subject => 'RightScale ServerTemplate Feedback (None)',
  :headers => { 'Content-Type' => 'text/html' },
  :via_options => { :arguments => pony_args },
  :body => mail_body)
end
log "Feedback: Ending"


################################################################################
# Install and use an EBS volume for caching
################################################################################
# If the user chooses to use an EBS volume for caching, create, attach, and
# mount the volume.  Set the cache directory to the mount point of the EBS
# volume so that this script will later configure the cache directory correctly.
################################################################################

#if node[:cloudoptimizer_configuration][:byte_cache][:ebs_volume_size] != '0'
#  log "EBS cache volume: creating EBS volume."
#  @ec2 = RightAws::Ec2.new(node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey],node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey])
#  volume_name = @ec2.create_volume('',50,'us-east-1a')
#  log "EBS cache volume: created #volume_name.aws_id"
#  attach_status = @ec2.attach_volume(volume_name.aws_id,'','/dev/sdh')
#  log "Attached #attach_status.aws_id to #attach_status.aws_instance_id with result #attach_status.aws_status"
#end

################################################################################
# Install AWS Keys
################################################################################
# If the user chooses to provide their AWS credentials, we can pick them up for
# use with CloudController.  This is less secure than entering the credentials 
# directly into CloudController, since the credentials are not encrypted.
################################################################################
log "AWS Keys: Starting"
unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  log "AWS Keys: Installing AWS access key in /root/aws_access_key."
  file "/root/aws_access_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
    action :create
  end
end
unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  log "AWS Keys: Installing AWS secret key in /root/aws_secret_key."
  file "/root/aws_secret_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey]}"
    action :create
  end
end
log "AWS Keys: Ending"


################################################################################
# Pre-accept the EULA
################################################################################
# The install script must find that the EULA has already been accepted or it
# will wait for user input, causing the RightScale instance to strand.
################################################################################
# Create the Cloudoptimizer config directory.  This is normally created by the 
# installer, but the installer requires that it already exist to contain the 
# EULA acceptance file, we must create it before the installer runs.
log "EULA: Starting"
log "Creating default config directory (/etc/cloudoptimizer)."
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
log "Creating EULA acceptance files."

# For 0.9.4 and earlier
log "EULA: Creating old style EULA acceptance file."
file "/etc/cloudoptimizer/accept-eula.txt" do
  owner "root"
  group "root"
  mode "0755"
  content "RS Accepted EULA"
  action :create
end
# For 1.1.5 and later
log "EULA: Creating new style EULA acceptance file."
file "/etc/cloudoptimizer/accepted-cloudoptimizer-eula" do
  owner "root"
  group "root"
  mode "0755"
  content "true"
  action :create
end
log "EULA: Ending"


################################################################################
# Fix syslog-ng
################################################################################
# Older versions of the package post-installation script expect a static name
# for the syslog-ng source.  If the name wasn't what we expected, syslog-ng
# would fail, causing installtion to fail.  So, this is a bit of a hack to
# install a fixed syslog-ng config stanza before the post-install script runs.
################################################################################
log "Fix syslog: Starting"
if node[:cloudoptimizer][:version] == '0.9.4' || node[:cloudoptimizer][:version] == '0.9.3.2' || node[:cloudoptimizer][:version] == '0.9.3.1'
  log "Fix syslog: Version 0.9.4 or earlier - fix required."
  if File.exists?("/etc/syslog-ng/syslog-ng.conf")
    log "Fix syslog: syslog-ng is installed; fixing config."
  else
    log "Fix syslog: syslog-ng is not installed; nothing to do."
  end
  bash "fix_syslog" do
    user "root"
    cwd "/tmp"
    code <<-EOH
    CONF=/etc/syslog-ng/syslog-ng.conf
    if [ -f "$CONF" ]
      source=`grep -m1 ^source ${CONF} |cut -d' ' -f2`
      echo "destination d_cloudoptimizer { file(\"/var/log/cloudoptimizer/cloudoptimizer.log\" create_dirs(yes)); };" >>$CONF
      echo "destination d_cloudcopy { file(\"/var/log/cloudoptimizer/cloudcopy.log\" create_dirs(yes)); };" >>$CONF
      echo "destination d_cloudlicense { file(\"/var/log/cloudoptimizer/cloudlicense.log\" create_dirs(yes)); };" >>$CONF
      echo "filter f_cloudoptimizer { level(info..emerg) and program(\"cloudoptimizer\"); };" >>$CONF
      echo "filter f_cloudcopy { level(info..emerg) and program(\"cloudcopy\"); };" >>$CONF
      echo "filter f_cloudlicense { level(info..emerg) and program(\"cloudlicense\"); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudoptimizer); destination(d_cloudoptimizer); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudcopy); destination(d_cloudcopy); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudlicense); destination(d_cloudlicense); };" >>$CONF
    fi
    EOH
  end
  log "Fix syslog: Ending"
else
  log "Fix syslog: Version 1.1.5 or later - fix unnecessary."
end

################################################################################
# Set up repositories
################################################################################
# CloudOpt runs on both Ubuntu and CentOS linux, which require different 
# repositories.  Detect the linux distribution and then install the appropriate 
# repository.
################################################################################
log "Repositories: Starting"
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  case node[:platform]
    when "ubuntu"
      log "Repositories:Installing on Ubuntu; using apt repository."
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
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
      log "Repositories:Installing on CentOS; using yum repository."
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
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
      log "Repositories: Installing on Ubuntu; using apt repository."
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
      log "Repositories: Installing on CentOS; using yum repository."

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
log "Repositories: Ending"


################################################################################
# Install firewall rules
################################################################################
# This opens the CloudOptimizer ports in iptables.  This step is required for 
# RackSpace instances and should do no harm on others.
################################################################################
log "Firewall rules: Starting"
log "Modifying firewall rules to allow CloudOptimizer ports."
if node[:sys_firewall][:enabled] == "enabled"
  include_recipe "iptables"
  sys_firewall "9001"
  sys_firewall "9002"
  sys_firewall "9003"
end
log "Firewall rules: Ending"


################################################################################
# Install python 2.6
################################################################################
# Python 2.6 is required for CloudOptimizer, but not available on Ubuntu 12.04.
# Install it manually if we're running on 12.04.  Install and use gdebi in
# order to manage the rather convoluted dependencies.
################################################################################
if node[:cloudoptimizer][:version] == 'latest' || node[:cloudoptimizer][:version] == '1.1.5' || node[:cloudoptimizer][:version] == '0.9.4' || node[:cloudoptimizer][:version] == '0.9.3.2'
  log "Install python: Starting"
  if node[:platform_version] == '12.04'
    log "Install python: Running on Ubuntu 12.04.  Installing python2.6 for compatibilty."
    package "gdebi"
    if node[:languages][:ruby][:host_cpu] == 'i686'
      log "Install python: Using the i386 packages."
      remote_file "/var/tmp/python2.6-minimal_2.6.7-4ubuntu1_i386.deb" do
        source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6-minimal_2.6.7-4ubuntu1_i386.deb"
      end
      remote_file "/var/tmp/python2.6_2.6.7-4ubuntu1_i386.deb" do
        source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6_2.6.7-4ubuntu1_i386.deb"
      end
      execute "gdebi" do
        command "gdebi --n /var/tmp/python2.6-minimal_2.6.7-4ubuntu1_i386.deb"
      end
      execute "gdebi" do
        command "gdebi --n /var/tmp/python2.6_2.6.7-4ubuntu1_i386.deb"
      end
    elsif node[:languages][:ruby][:host_cpu] == 'x86_64'
      log "Install python: Using the amd64 packages."
      remote_file "/var/tmp/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb" do
        source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb"
      end
      remote_file "/var/tmp/python2.6_2.6.7-4ubuntu1_amd64.deb" do
        source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6_2.6.7-4ubuntu1_amd64.deb"
      end
      execute "gdebi" do
        command "gdebi --n /var/tmp/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb"
      end
      execute "gdebi" do
        command "gdebi --n /var/tmp/python2.6_2.6.7-4ubuntu1_amd64.deb"
      end
    else
      log "Install python: Couldn't determine architecture."
    end
  end
  log "Install python: Ending"
end


################################################################################
# Install cloudoptimizer
################################################################################
# Install and configure the CloudOptimizer packages.  This section must be 
# updated for each new release.  If not updated, the version lock input will not
# display new versions.  The RightScript will always install the latest version 
# available when the version lock is set to "latest."
################################################################################
# The version locking is kind of a pain the way it is done, but chef doesn't 
# appear to honor architecture in the package command as it should, at least on 
# RightScale.  I wasted a lot of time trying to get it to work before settling 
# on manually specifying the package options.  Thus, we have a lot of manual 
# labor here to determine which package to install when version locking is 
# selected.  We should revisit this in the future and see if we can simplify.
log "Install cloudoptimizer: Starting"
  log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
  case node[:platform]
  when "ubuntu"
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing the latest cloudoptimizer package."
      package "cloudoptimizer"
    else
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
      log "Install cloudoptimizer: Installing the latest cloudoptimizer package."
      execute "yum" do
        command "yum -y install cloudoptimizer"
      end
    else
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


################################################################################
# Install CloudController
################################################################################
# Install the cloudoptimizer-s3 package if selected by input
################################################################################
log "Install CloudController: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  log "Install CloudController: Installing cloudoptimizer-s3 package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-s3"
    end
  else
    package "cloudoptimizer-s3"
  end
end
log "Install CloudController: Ending"

################################################################################
# Install cloudoptimizer-tools
################################################################################
# Install the cloudoptimizer-tools package if selected by input.  This is not
# necessary on first install, but may be useful when cloudoptimizer-tools is
# updated separately from cloudoptimizer.
################################################################################
log "Install cloudoptimizer-tools: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
  log "Install cloudoptimizer-tools: Installing cloudoptimizer-tools package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-tools"
    end
  else
    package "cloudoptimizer-tools"
  end
end
log "Install cloudoptimizer-tools: Ending"


################################################################################
# Install WebUI
################################################################################
# Install the cloudoptimizer-webui package if selected by input.  Starting in
# version 1.1.5, enable by default.
################################################################################
log "Install WebUI: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  log "Install WebUI: Installing cloudoptimizer-webui package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-webui"
    end
  else
    package "cloudoptimizer-webui"
  end
end
log "Install WebUI: Ending"


################################################################################
# Install vtun
################################################################################
# Install the vtun package if selected by input.  vtun is commonly used to
# tunnel traffic to CloudOptimizer for interception.
################################################################################
log "Install vtun: Starting"
if node[:cloudoptimizer_packages][:optional][:vtun] == 'Install'
  log "Install vtun: Installing vtun."
  package "vtun"
end
log "Install vtun: Ending"


################################################################################
# Install frox
################################################################################
# Install the frox package if selected by input.  frox is a plain FTP proxy and
# can be used with FTP clients that don't support FTP over HTTP.
################################################################################
log "Install frox: Starting"
if node[:cloudoptimizer_packages][:optional][:frox] == 'Install'
  log "Install frox: Installing frox."
  package "frox"
end
log "Install frox: Ending"


################################################################################
# Install mysql-proxy
################################################################################
# Install the mysql-proxy package if selected by input.  mysql-proxy is the
# simplest way to intercept MySQL replication traffic when CloudOptimizer is
# installed as a gateway.
################################################################################
log "Install mysql-proxy: Starting"
if node[:cloudoptimizer_packages][:optional][:mysql_proxy] == 'Install'
  log "Install mysql-proxy: Installing mysql-proxy."
  package "mysql-proxy"
end
log "Install mysql-proxy: Ending"


################################################################################
# Create alternate home directory
################################################################################
# If the user has specified a different home directory than the default, create
# the directory and set ownership and permissions.
################################################################################
log "Create home: Starting"
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  log "Create home: Creating input-specified CloudOptimizer home directory."
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
log "Create home: Ending"

################################################################################
# Create alternate log directory
################################################################################
# If the user has specified a different log directory than the default, create
# the directory and set ownership and permissions.
################################################################################
# Create alternate log directory
log "Create log dir: Starting"
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  log "Create log dir: Creating input-specified CloudOptimizer log directory."
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
log "Create log dir: Ending"


################################################################################
# Set transparent proxy address mappings
################################################################################
# Get the first public and private IP addresses and use them as the default
# values for the transparent proxy mapping unless the user has chosen to enter
# addresses manually.
################################################################################
log "Transparent mapping: Starting"
if node[:cloudoptimizer_configuration][:transparency][:transp_intip] == 'First private IP address'
  log "Transparent mapping: Setting internal IP address to #{node[:cloud][:private_ips][0]}"
  $internal_ip = node[:cloud][:private_ips][0]
else
  log "Transparent mapping: Setting internal IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}"
  $internal_ip = node[:cloudoptimizer_configuration][:transparency][:transp_intip]
end
# Set the public/external IP address
if node[:cloudoptimizer_configuration][:transparency][:transp_extip] == 'First public IP address'
  log "Transparent mapping: Setting external IP address to: #{node[:cloud][:public_ips][0]}"
  $external_ip = node[:cloud][:public_ips][0]
else
  log "Transparent mapping: Setting external IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}"
  $external_ip = node[:cloudoptimizer_configuration][:transparency][:transp_extip]
end
log "Transparent mapping: Ending"
  
if node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address] != "ignore"  && node[:cloudoptimizer_mysql][:endpoints][:master_db_address] != "ignore"
  node[:cloudoptimizer_configuration][:peer_statement] = "\"enabled\": [\"#{node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address]}\"], \"endpoints\": { \"#{node[:cloudoptimizer_mysql][:endpoints][:master_cloudoptimizer_address]}\": [\"#{node[:cloudoptimizer_mysql][:endpoints][:master_db_address]}\"] }"
end

################################################################################
# Build configuration from templates
################################################################################
# We use chef templates to build the configuration file.  When new options are 
# added to the configuration file, we must add a new template to match.  When 
# multiple versions of the configuration file are supported at the same time, we
# must determine the CloudOptimizer version that we are installing and use the 
# appropriate template for that version.
################################################################################
log "Template config: Starting"
log "Template config: CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1'
  log "Template config: Using template cloudoptimizer.conf.0.9.3.erb."
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
elsif node[:cloudoptimizer][:version] == '0.9.4'
  log "Template config: Using template cloudoptimizer.conf.0.9.4.erb."
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
  log "Template config: Using template cloudoptimizer.conf.erb."
  template "/etc/cloudoptimizer.conf" do
    source "cloudoptimizer.conf.erb"
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
      :webui_login => node[:cloudoptimizer][:web_interface][:webui_login],
      :webui_passwd => node[:cloudoptimizer][:web_interface][:webui_passwd]
    )
  end
end
log "Template config: Ending"


################################################################################
# Install stored configurations
################################################################################
# Here we give the user the option to retrieve stored configuration files for a 
# truly persistent CloudOptimizer installation that can be stopped and started 
# without requiring reconfiguration.  Files must be provided on an unprotected 
# HTTP server.

# Stored configuration files take precedence over all other configuration.  
# Thus, if the user sets individual configuration options, but also specifies a 
# stored config file, the individual configuration options will be ignored.
################################################################################
# Stored CloudOptimizer configuration file
log "Stored configs: Starting"
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  log "Stored configs: No stored cloudoptimizer configuration specified."
else
  log "Stored configs: Installing saved cloudoptimizer configuration from: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
  remote_file "/etc/cloudoptimizer.conf" do
    source node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]
    owner "root"
    group "root"
    mode "0644"
  end
end

# Stored vtun configuration file
if node[:cloudoptimizer][:stored_configuration][:vtun] == 'none'
  log "Stored configs: No stored vtun configuration specified."
else
  log "Stored configs: Installing saved vtun configuration from: #{node[:cloudoptimizer][:stored_configuration][:vtun]}"
  remote_file "/etc/vtund.conf" do
    source node[:cloudoptimizer][:stored_configuration][:vtun]
    owner "root"
    group "root"
    mode "0644"
  end
end
log "Stored configs: Ending"


################################################################################
# Restart cloudoptimizer
################################################################################
# Restart to pick up all the configuration changes.
################################################################################
log "Final restart: Starting"
service "cloudoptimizer" do
  action :restart
end
log "Final restart: Ending"


################################################################################
# RightScale process monitoring
################################################################################
# Add the cloudoptimizer daemons for monitoring in the RightScale dashboard
################################################################################
#log "RightScale monitoring: Starting"
#rs_utils_monitor_process "cloudlicense"
#rs_utils_monitor_process "cloudoptimizer"
#log "RightScale monitoring: Ending"

rightscale_marker :end
