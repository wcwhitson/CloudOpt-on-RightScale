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
# Install AWS Keys
################################################################################
# If the user chooses to provide their AWS credentials, we can pick them up for
# use with CloudController.  This is less secure than entering the credentials 
# directly into CloudController, since the credentials are not encrypted.
################################################################################
log "AWS Keys: Starting"
unless node[:mediawiki][:cloud_credentials][:aws][:accesskey] == "None"
  log "AWS Keys: Installing AWS access key in /root/aws_access_key."
  file "/root/aws_access_key" do
    owner "root"
    group "root"
    mode "0700"
    content "#{node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey]}"
    action :create
  end
end
unless node[:mediawiki][:cloud_credentials][:aws][:secretkey] == "None"
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
# Install MediaWiki
################################################################################
# 
################################################################################
log "Repositories: Starting"

remote_file "/var/tmp/mediawiki-1.19.1.tar.gz" do
  source "http://download.wikimedia.org/mediawiki/1.19/mediawiki-1.19.1.tar.gz"
end

install_dir = node[:mediawiki][:installation_directory]

execute "tar" do
  command "tar --strip-components=1 -xvzf /var/tmp/mediawiki-1.19.1.tar.gz -C install_dir"
end

log "Repositories: Ending"


################################################################################
# Set defaults to public IP address
################################################################################
# 
################################################################################
log "Transparent mapping: Starting"
if node[:mediawiki][:dns_name] == 'Public IP'
  log "Setting DNS name to #{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:dns_name] = node[:cloud][:public_ips][0]
end
if node[:mediawiki][:admin_email] == 'apache@Public IP'
  log "Setting admin email to apache@#{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:admin_email] = node[:cloud][:public_ips][0]
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
  log "Template config: Using template LocalSettings.php.erb."
  template "/var/www/LocalSettings.php" do
    source "LocalSettings.php.erb"
    mode "0644"
    owner "root"
    group "root"
  end


rightscale_marker :end
