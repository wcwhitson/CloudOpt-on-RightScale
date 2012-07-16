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


################################################################################
# Install Logo
################################################################################
# Grab the logo from an HTTP URL and install in the default location
################################################################################
log "Install Logo: Starting"
remote_file "#{node[:mediawiki][:installation_directory]}/skins/common/images/wiki.png" do
  source "http://#{node[:mediawiki][:download_logo_url]}"
end
log "Install Logo: Ending"

################################################################################
# Set defaults to public IP address
################################################################################
# Set the DNS name for Mediawiki to the public IP address as a default.  This
# is not really what most users would want to run with, but it does ensure
# that MediaWiki produces usable links if no DNS name is entered.
################################################################################
log "Set defaults: Starting"
if node[:mediawiki][:dns_name] == 'Public IP'
  log "Setting DNS name to #{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:dns_name] = node[:cloud][:public_ips][0]
end
if node[:mediawiki][:admin_email] == 'apache@Public IP'
  log "Setting admin email to apache@#{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:admin_email] = node[:cloud][:public_ips][0]
end
log "DNS name: Ending"

log "Set defaults: Ending"


################################################################################
# Build configuration from templates
################################################################################
# Build LocalSettings.php from inputs.
################################################################################
log "Template config: Starting"
log "Template config: Using template LocalSettings.php.erb."
template "#{node[:mediawiki][:installation_directory]}/LocalSettings.php" do
  source "LocalSettings.php.erb"
  mode "0644"
  owner "root"
  group "root"
end

rightscale_marker :end
