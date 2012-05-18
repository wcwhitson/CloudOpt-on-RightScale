#
# Cookbook Name: Configure CloudOptimizer 
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Configuration  =========="

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
	log "Setting internal IP address to:"
	log node[:cloud][:private_ips][0]
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

log "========== Ending CloudOptimizer Configuration =========="
