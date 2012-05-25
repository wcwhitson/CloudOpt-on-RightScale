#
# Cookbook Name: Configure CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Configuration  =========="

# Alternate home and log directories
# Unlike in the install script, here we do not delete the previous directories
# under the assumption that they actually contain user data.

# Create alternate home directory

unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  directory node[:cloudoptimizer_configuration][:file_locations][:home_directory] do
    owner "cloudoptimizer"
    group "cloudoptimizer"
    mode "0711"
    action :create
  end
end

# Create alternate log directory

unless node[:cloudoptimizer_configuration][:file_locations][:log_directory] == "/var/log/cloudoptimizer"
  directory node[:cloudoptimizer_configuration][:file_locations][:log_directory] do
    owner "root"
    group "root"
    mode "0700"
    action :create
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
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerstat] == 'Install'
  package "cloudoptimizer-stat"
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
  log "Setting internal IP address to: #{node[:cloud][:private_ips][0]}"
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
if node[:cloudoptimizer][:version] == '0.9.3.2' or node[:cloudoptimizer][:version] == '0.9.3.1' or node[:cloudoptimizer][:version] == '0.9.3' or node[:cloudoptimizer][:version] == '0.9.2.3'
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
else
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
      :transp_ext_ip => "$external_ip",
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

log "========== Ending CloudOptimizer Configuration =========="
