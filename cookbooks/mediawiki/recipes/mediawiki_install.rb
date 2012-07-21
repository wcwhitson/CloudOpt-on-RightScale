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
# Install Dependencies
################################################################################
# 
################################################################################

package "ImageMagick"

################################################################################
# Install MediaWiki
################################################################################
# 
################################################################################
log "Install MediaWiki: Starting"

install_dir = node[:mediawiki][:installation_directory]

if node[:mediawiki][:mw_version] = '1.19.1'
  remote_file "#{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_current]}" do
    source "#{node[:mediawiki][:package_url_current]}"
  end
  
  execute "tar" do
    command "tar --strip-components=1 -xvzf #{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_current]} -C #{install_dir}"
  end
  
  remote_file "#{node[:mediawiki][:installation_directory]}/includes/installer/Installer.php" do
    source "http://kb.cloudopt.com/Installer.txt"
  end
elsif node[:mediawiki][:mw_version] = '1.18.4'
  remote_file "#{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_previous]}" do
    source "#{node[:mediawiki][:package_url_previous]}"
  end
  
  execute "tar" do
    command "tar --strip-components=1 -xvzf #{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_previous]} -C #{install_dir}"
  end
else
  log "Unknown MediaWiki version.  This error should never happen."
end

log "Install MediaWiki: Ending"

################################################################################
# Install getmwconfig.php
################################################################################
# This script gets variables from the MediaWiki generated LocalSettings.php.  It
# is not really a template; we're just treating it like a template in order to
# install it.
################################################################################
log "Install getmwconfig.php: Starting"
template "/usr/bin/getmwconfig.php" do
  source "getmwconfig.php.erb"
  mode "0754"
  owner "root"
  group "root"
end

################################################################################
# Install Logo
################################################################################
# Grab the logo from an HTTP URL and install in the default location
################################################################################
log "Install Logo: Starting"
remote_file "#{node[:mediawiki][:installation_directory]}/skins/common/images/custom.png" do
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
template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
  source "LocalSettings.php.erb"
  mode "0644"
  owner "root"
  group "root"
end

rightscale_marker :end
