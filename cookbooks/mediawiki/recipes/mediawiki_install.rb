################################################################################
# mediawiki_install.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# First time installation and configuration of mediawiki
################################################################################

rightscale_marker :begin

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
log "Install MediaWiki: Starting"

remote_file "/var/tmp/mediawiki-1.19.1.tar.gz" do
  source "http://download.wikimedia.org/mediawiki/1.19/mediawiki-1.19.1.tar.gz"
end

install_dir = node[:mediawiki][:installation_directory]

execute "tar" do
  command "tar --strip-components=1 -xvzf /var/tmp/mediawiki-1.19.1.tar.gz -C #{install_dir}"
end

log "Install MediaWiki: Ending"


rightscale_marker :end
