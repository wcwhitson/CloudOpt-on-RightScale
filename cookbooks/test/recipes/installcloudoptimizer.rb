#
# Cookbook Name: Test
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "=== Starting Install CloudOptimizer ==="

# Prepare EULA Acceptance

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

case node[:platform]
when "ubuntu"
	log "Installing on Ubuntu"
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
	package "rsyslog"
when "centos"
	log "Installing on CentOS"
	remote_file "/var/tmp/CloudOpt.selfextracting" do
		source "https://s3.amazonaws.com/rpm-cloudopt/CloudOpt.selfextracting"
		mode "0755"
	end
	execute "CloudOpt.selfextracting" do
		command "/var/tmp/CloudOpt.selfextracting"
	end
end

# Install CloudOptimizer

package "cloudoptimizer"

log "=== Ending Install CloudOptimizer ==="
