#
# Cookbook Name: Test
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning CloudOptimizer Installation =========="

# Prepare EULA Acceptance

log "Noting EULA acceptance."
directory "/etc/cloudoptimizer" do
	owner "root"
	group "root"
	mode "0755"
	action :create
end

file "/etc/cloudoptimizer/accept-eula.txt" do
	owner "root"
	group "root"
	mode "0755"
	content "RS Accepted EULA"
	action :create
end

# Set up CloudOpt repository

log "Adding CloudOpt software repositories."
case node[:platform]
when "ubuntu"
	log "Installing on Ubuntu; using apt repository."
	remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
		source "http://apt.cloudopt.com/cloudopt.maverick.list"
	end
	remote_file "/var/tmp/cloudopt.key.asc" do
		source "http://apt.cloudopt.com/cloudopt.key.asc"
	end
	execute "apt-key" do
		command "apt-key add /var/tmp/cloudopt.key.asc"
	end
	execute "apt-get" do
		command "apt-get update"
	end
	log "Installing rsyslog for better compatibility on Ubuntu."
	package "rsyslog"
when "centos"
	log "Installing on CentOS; using yum repository."
	remote_file "/var/tmp/CloudOpt.selfextracting" do
		source "https://s3.amazonaws.com/rpm-cloudopt/CloudOpt.selfextracting"
		mode "0755"
	end
	execute "CloudOpt.selfextracting" do
		command "/var/tmp/CloudOpt.selfextracting"
	end
end

# Set up firewall rules

log "Modifying firewall rules to allow CloudOptimizer ports."
if node[:sys_firewall][:enabled] == "enabled"
	include_recipe "iptables"
	sys_firewall "9001"
	sys_firewall "9002"
	sys_firewall "9003"
end

# Set up security groups

#if ENV.has_key?('EC2_HOME')

# Install CloudOptimizer

log "Installing the cloudoptimizer package."
package "cloudoptimizer"

# Install stored configurations

if node[:test][:configuration][:stored][:cloudoptimizer] == 'none'
	log "No stored cloudoptimizer configuration specified."
else
	$reload_config = "yes"
	log "Installing saved cloudoptimizer configuration node[:test][:configuration][:stored][:cloudoptimizer]"
	remote_file "/etc/cloudoptimizer.conf" do
		source node[:test][:configuration][:stored][:cloudoptimizer]
		owner "root"
		group "root"
		mode "0644"
	end
end

if node[:test][:configuration][:stored][:vtun] == 'none'
        log "No stored vtun configuration specified."
else
	$reload_config = "yes"
        log "Installing saved vtun configuration node[:test][:configuration][:stored][:vtun]"
        remote_file "/etc/vtund.conf" do
                source node[:test][:configuration][:stored][:vtun]
                owner "root"
                group "root"
                mode "0644"
        end
end

template "/etc/cloudoptimzer.conf" do
  source "cloudoptimizer.conf.erb"
  mode "0644"
  owner "root"
  group "root"
  variables(
	:home_directory => node[:test][:configuration][:home_directory],
	:default_cache_size => node[:test][:configuration][:default_cache_size],
	:socket_location => node[:test][:configuration][:socket_location],
	:bitmap_size => node[:test][:configuration][:bitmap_size],
	:db_memory_size => node[:test][:configuration][:db_memory_size],
	:log_directory => node[:test][:configuration][:log_directory],
	:log_key => node[:test][:configuration][:log_key],
	:compression_engine => node[:test][:configuration][:compression_engine],
	:default_compression_level => node[:test][:configuration][:default_compression_level],
	:optimistic_deduplication => node[:test][:configuration][:optimistic_deduplication],
	:cache_promotion => node[:test][:configuration][:cache_promotion],
	:compress_cache => node[:test][:configuration][:compress_cache],
	:thread_count => node[:test][:configuration][:thread_count],
	:intelligent_mesh => node[:test][:configuration][:intelligent_mesh],
	:local_proxy_address => node[:test][:configuration][:local_proxy_address],
	:peer_proxy_port => node[:test][:configuration][:peer_proxy_port],
	:peer_encryption => node[:test][:configuration][:peer_encryption],
	:ssl_key => node[:test][:configuration][:ssl_key],
	:ssl_cert => node[:test][:configuration][:ssl_cert],
	:ssl_ca => node[:test][:configuration][:ssl_ca],
	:peer_statement => node[:test][:configuration][:peer_statement]
  )
end

if $reload_config == "yes"
	service "cloudoptimizer" do
		action :restart
	end
end

log "========== Ending CloudOptimizer Installation =========="
