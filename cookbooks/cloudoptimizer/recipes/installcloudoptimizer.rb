#
# Cookbook Name: Install CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

def mail_feedback
  log "Mailing feedback at start of script run"
  # Install pony for mail support
  g = gem_package "pony" do
    action :nothing
  end
 
  g.run_action(:install)
 
  Gem.clear_paths
  require 'pony'

  # Provide automatic feedback to cloudopt
  if node[:cloudoptimizer][:user_feedback] == "Detailed feedback"
    log "Sending detailed feedback."
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
    :to => 'bill@cloudopt.com',
    :subject => 'RightScale ServerTemplate Feedback (Detailed)',
    :headers => { 'Content-Type' => 'text/html' },
    :body => mail_body)
  elsif node[:cloudoptimizer][:user_feedback] == "Basic feedback"
    log "Sending basic feedback."
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
    :to => 'bill@cloudopt.com',
    :subject => 'RightScale ServerTemplate Feedback (Basic)',
    :headers => { 'Content-Type' => 'text/html' },
    :body => mail_body)
  else
    log "Automatic feedback disabled."
    mail_body = Array.new
    mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
    Pony.mail(
    :to => 'bill@cloudopt.com',
    :subject => 'RightScale ServerTemplate Feedback (None)',
    :headers => { 'Content-Type' => 'text/html' },
    :body => mail_body)
  end
end


# Install AWS Keys
def install_aws_access_key
  log "Installing AWS access key in /root/aws_access_key."
  file "/root/aws_access_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
    action :create
  end
end

def install_aws_secret_key
  log "Installing AWS secret key in /root/aws_secret_key."
  file "/root/aws_secret_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey]}"
    action :create
  end
end

# Create Default Config Directory
def make_default_config_dir
  log "Creating default config directory (/etc/cloudoptimizer)."
  directory "/etc/cloudoptimizer" do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end
end

# Pre-accept the EULA
def accept_eula
  log "Creating EULA acceptance files."
  # Create the EULA acceptance file.  The content of the file doesn't matter, but we set it to
  # "RS Accepted EULA" so that we can tell how it was generated.
  # The file that the installation script checks changed in version 1.1.5, so for now, we just
  # set both files.
  # For 0.9.4 and earlier
  log "Creating old style EULA acceptance file."
  file "/etc/cloudoptimizer/accept-eula.txt" do
    owner "root"
    group "root"
    mode "0755"
    content "RS Accepted EULA"
    action :create
  end
  # For 1.1.5 and later
  log "Creating new style EULA acceptance file."
  file "/etc/cloudoptimizer/accepted-cloudoptimizer-eula" do
    owner "root"
    group "root"
    mode "0755"
    content "true"
    action :create
  end
end

# Fix syslog-ng
def fix_syslogng
  log "Adding syslog config to preempt older cloudoptimizer postinstall scripts with bad syslog-ng source name."
  source = `grep -m1 ^source /etc/syslog-ng/syslog-ng.conf |cut -d' ' -f2`
  
  open('/etc/syslog-ng/syslog-ng.conf', 'a') { |f|
    f << "destination d_cloudoptimizer { file(\"/var/log/cloudoptimizer/cloudoptimizer.log\" create_dirs(yes)); };\n"
    f << "destination d_cloudcopy      { file(\"/var/log/cloudoptimizer/cloudcopy.log\" create_dirs(yes));      };\n"
    f << "destination d_cloudlicense   { file(\"/var/log/cloudoptimizer/cloudlicense.log\" create_dirs(yes));   };\n"
    f << "filter      f_cloudoptimizer { level(info..emerg) and program(\"cloudoptimizer\"); };\n"
    f << "filter      f_cloudcopy      { level(info..emerg) and program(\"cloudcopy\"); };\n"
    f << "filter      f_cloudlicense   { level(info..emerg) and program(\"cloudlicense\"); };\n"
    f << "log { source(#{source}); filter(f_cloudoptimizer); destination(d_cloudoptimizer); };\n"
    f << "log { source(#{source}); filter(f_cloudcopy);      destination(d_cloudcopy); };\n"
    f << "log { source(#{source}); filter(f_cloudlicense);   destination(d_cloudlicense); };\n"
  }
end

# rsyslog
def install_rsyslog
  # Under certain circumstances, syslog-ng has caused problems with CloudOptimizer.
  # While those problems are solved at the time this comment was written, they have appeared as regressions
  # several times.  Installing rsyslog is a risk mitigation measure.
  log "Installing rsyslog for better compatibility with the installer."
  package "rsyslog"
end

# Install Ubuntu test repository
def install_repo_test_ubuntu
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
end

# Install CentOS test repository
def install_repo_test_centos
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

# Install Ubuntu repository
def install_repo_ubuntu
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
end

# Install CentOS repository
def install_repo_centos
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

# Install firewall rules
def install_firewall_rules
  # This opens the CloudOptimizer ports in iptables.  This step is required for RackSpace instances and should
  # do no harm on others.

  log "Modifying firewall rules to allow CloudOptimizer ports."
  if node[:sys_firewall][:enabled] == "enabled"
    include_recipe "iptables"
    sys_firewall "9001"
    sys_firewall "9002"
    sys_firewall "9003"
  end
end

# Install CloudOptimizer
def install_cloudoptimizer
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
    log "Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
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
end

# Install CloudController
def install_cloudcontroller
  log "Installing cloudoptimizer-s3 package."
  package "cloudoptimizer-s3"
end

# Install cloudoptimizer-tools
def install_cloudoptimizer_tools
  log "Installing cloudoptimizer-tools package."
  package "cloudoptimizer-tools"
end

# Install WebUI
def install_webui
  log "Installing cloudoptimizer-webui package."
  package "cloudoptimizer-webui"
end

# Install vtun
def install_vtun
  log "Installing vtun."
  package "vtun"
end

# Install frox
def install_frox
  log "Installing frox."
  package "frox"
end

# Install MySQL proxy
def install_mysql_proxy
  log "Installing mysql-proxy."
  package "mysql-proxy"
end

# Create alternate home directory
def create_alternate_home_dir
  log "Creating input-specified CloudOptimizer home directory."
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
def create_alternate_log_dir
  log "Creating input-specified CloudOptimizer log directory."
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

def use_config_template_093
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
end

def use_config_template_094
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
end

def use_config_template_latest
  log "Using template cloudoptimizer.conf.erb."
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

def install_stored_cloudoptimizer_config
  log "Installing saved cloudoptimizer configuration from: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
  remote_file "/etc/cloudoptimizer.conf" do
    source node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]
      owner "root"
      group "root"
      mode "0644"
    end
end

def install_stored_vtun_config
  log "Installing saved vtun configuration from: #{node[:cloudoptimizer][:stored_configuration][:vtun]}"
  remote_file "/etc/vtund.conf" do
    source node[:cloudoptimizer][:stored_configuration][:vtun]
    owner "root"
    group "root"
    mode "0644"
  end
end

def cloudoptimizer_init_restart
  log "Restarting CloudOptimizer to pick up configuration changes."
  service "cloudoptimizer" do
    action :restart
  end
end

def set_transparent_proxy_addresses
  log "Setting up IP address mapping for transparent proxy…"
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
end


#
# Main script starts here
#

# Send feedback
mail_feedback

# Install AWS Keys
#
# If the user chooses to provide their AWS credentials, we can pick them up for use
# with CloudController.  This is less secure than entering the credentials directly
# into CloudController, since the credentials are not encrypted.
unless node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey] == "None"
  install_aws_access_key
end
unless node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey] == "None"
  install_aws_secret_key
end

# Prepare EULA Acceptance
make_default_config_dir
accept_eula

# Fix syslog problems
# install_rsyslog
if File.exists?("/etc/syslog-ng/syslog-ng.conf")
  fix_syslogng
else
  log "syslog-ng is not installed."
end

# Set up CloudOpt repository
#
# CloudOpt runs on both Ubuntu and CentOS linux, which require different repositories.  Here we detect
# the linux distribution and then install the appropriate repository.
log "Installing CloudOpt software repository."
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  case node[:platform]
  when "ubuntu"
    install_repo_test_ubuntu
  when "centos"
    install_repo_test_centos
  end
else
  case node[:platform]
  when "ubuntu"
    install_repo_ubuntu
  when "centos"
    install_repo_centos
  end
end

# Set up firewall rules
install_firewall_rules

# Install CloudOptimizer
#install_cloudoptimizer
package "cloudoptimizer"

# Create alternate home directory
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  create_alternate_home_dir
end

# Create alternate log directory
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  create_alternate_log_dir
end

# Install additional packages

# Install the CloudController package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  install_cloudcontroller
end

# Install the cloudoptimizer-tools package if selected
if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
  install_cloudoptimizer_tools
end

# Install the CloudOptimizer stats GUI
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  install_webui
end

# Install vtun to support tunneling traffic to CloudOptimizer for interception
if node[:cloudoptimizer_packages][:optional][:vtun] == 'Install'
  install_vtun
end

# Install the frox package to proxy regular FTP
if node[:cloudoptimizer_packages][:optional][:frox] == 'Install'
  install_frox
end

# Install mysql-proxy for the MySQL interception solution
if node[:cloudoptimizer_packages][:optional][:mysql_proxy] == 'Install'
  install_mysql_proxy
end

# Here we set the public and private addresses to use when the transparent proxy is enabled.  By default, we use the
# first returned IP address for each, as there will generally be only one.  If the user has specified an address, we
# use that instead.

# Set the private/internal IP address
set_transparent_proxy_addresses

# We use chef templates to build the configuration file.  When new options are added to the configuration file, we must
# add a new template to match.  When multiple versions of the configuration file are supported at the same time, we must
# determine the CloudOptimizer version that we are installing and use the appropriate template for that version.

log "CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1'
  use_config_template_093
elsif node[:cloudoptimizer][:version] == '0.9.4'
  use_config_template_094
else
  use_config_template_latest
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
  install_stored_cloudoptimizer_config
end

# Stored vtun configuration file
if node[:cloudoptimizer][:stored_configuration][:vtun] == 'none'
  log "No stored vtun configuration specified."
else
  install_stored_vtun_config
end

# Reload the CloudOptimizer configuration.  This will put any changes into the running config and will 
# be harmless otherwise.
cloudoptimizer_init_restart

# Set up RightScale monitoring

rs_utils_monitor_process "cloudlicense"
rs_utils_monitor_process "cloudoptimizer"

rs_utils_marker :end
