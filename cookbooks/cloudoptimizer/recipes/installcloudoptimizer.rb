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

if node[:cloudoptimizer][:version] == 'latest'
	log "Installing the latest cloudoptimizer package."
	package "cloudoptimizer"
else
	case node[:platform]
	when "ubuntu"
		case node[:cloudoptimizer][:version]
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

if node[:cloudoptimizer][:packages][:optional][:vtun] == 'Install'
	package "vtun"
end

if node[:cloudoptimizer][:packages][:optional][:frox] == 'Install'
        package "frox"
end

if node[:cloudoptimizer][:packages][:optional][:mysql_proxy] == 'Install'
        package "mysql-proxy"
end

# Install stored configurations

if node[:cloudoptimizer][:stored][:cloudoptimizer] == 'none'
	log "No stored cloudoptimizer configuration specified."
else
	$reload_config = "yes"
	log "Installing saved cloudoptimizer configuration node[:cloudoptimizer][:configuration][:stored][:cloudoptimizer]"
	remote_file "/etc/cloudoptimizer.conf" do
		source node[:cloudoptimizer][:configuration][:stored][:cloudoptimizer]
		owner "root"
		group "root"
		mode "0644"
	end
end

if node[:cloudoptimizer][:stored][:vtun] == 'none'
        log "No stored vtun configuration specified."
else
	$reload_config = "yes"
        log "Installing saved vtun configuration node[:cloudoptimizer][:configuration][:stored][:vtun]"
        remote_file "/etc/vtund.conf" do
                source node[:cloudoptimizer][:configuration][:stored][:vtun]
                owner "root"
                group "root"
                mode "0644"
        end
end

template "/etc/cloudoptimizer.conf" do
  source "cloudoptimizer.conf.erb"
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

if $reload_config == "yes"
	service "cloudoptimizer" do
		action :restart
	end
end

log "========== Ending CloudOptimizer Installation =========="
