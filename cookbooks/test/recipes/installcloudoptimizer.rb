#
# Cookbook Name: Test
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "=== Starting Install CloudOptimizer ==="

# Prepare EULA Acceptance

directory "/etc/cloudoptimizer" do
	owner "cloudoptimizer"
	group "cloudoptimizer"
	mode "0755"
	action :create
end

file "/etc/cloudoptimizer/accept-eula.txt" do
	owner "cloudoptimizer"
	group "cloudoptimizer"
	mode "0755"
	content "RS Accepted EULA"
	action :create
end

# Set up CloudOpt repository

case node[:platform]
	when "ubuntu"
	log "Installing on Ubuntu"
#	execute "wget" do
#		command "wget http://apt.cloudopt.com/cloudopt.maverick.list --directory-prefix=/etc/apt/sources.list.d"
#		action :run
#	end
#	execute "wget" do
#		command "wget http://apt.cloudopt.com/cloudopt.key.asc"
#		action :run
#	end
#	execute "apt-key" do
#		command "apt-key add ./cloudopt.key.asc"
#		action :run
#	end
#	execute "apt-get"
#		command "apt-get update"
#		action :run
#	end
	when "centos"
	log "Installing on CentOS"
#	execute "wget" do
#		command "wget https://s3.amazonaws.com/rpm-cloudopt/CloudOpt.selfextracting"
#		action :run
#	end
#	execute "chmod" do
#		command "chmod u+x CloudOpt.selfextracting"
#		action :run
#	end
#	execute "CloudOpt.selfextracting" do
#		command "./CloudOpt.selfextracting"
#		action :run
#	end
	else
	log "Can't install.  This node is neither Ubuntu nor CentOS."
end

# Install CloudOptimizer

package "cloudoptimizer"

log "=== Ending Install CloudOptimizer ==="
