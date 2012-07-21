################################################################################
# mediawiki_install.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# First time installation and configuration of mediawiki.  This script installs
# everything necessary to run MediaWiki except the database
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
  
directory install_dir do
  action :create
end

if node[:mediawiki][:mw_version] = '1.19.1'
  remote_file "#{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_current]}" do
    source "#{node[:mediawiki][:package_url_current]}"
  end
  
  execute "tar" do
    command "tar --strip-components=1 -xvzf #{node[:mediawiki][:work_dir]}/#{node[:mediawiki][:package_name_current]} -C #{install_dir}"
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
# Get a saved LocalSettings.php file
################################################################################
# If the user specifies a LocalSettings.php file to download, get it and use it
# to set auto-generated values in the new config file.
################################################################################

if node[:mediawiki][:download_localsettings] != 'ignore'
  remote_file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:auto_config]}" do
    source "#{node[:mediawiki][:download_localsettings]}"
  end
  node[:mediawiki][:namespace] = `php /usr/bin/getmwconfig.php wgMetaNamespace #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
  node[:mediawiki][:secret_key] = `php /usr/bin/getmwconfig.php wgSecretKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
  node[:mediawiki][:upgrade_key] = `php /usr/bin/getmwconfig.php wgUpgradeKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
  node[:mediawiki][:db_type] = `php /usr/bin/getmwconfig.php wgDBtype #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
  node[:mediawiki][:db_name] = `php /usr/bin/getmwconfig.php wgDBname #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
else
  log "You did not install a LocalSettings.php, so you will need to initialize a new database by running mediawiki_first_time_config."
end

################################################################################
# Install Logo
################################################################################
# Grab the logo from an HTTP URL and install in the default location
################################################################################
log "Install Logo: Starting"
remote_file "#{node[:mediawiki][:installation_directory]}/skins/common/images/custom.png" do
  source "#{node[:mediawiki][:download_logo_url]}"
  mode "0644"
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

if node[:mediawiki][:mw_version] = '1.19.1'
  log "Template config: Using template LocalSettings.php.119.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
    source "LocalSettings.php.119.erb"
    mode "0644"
    owner "root"
    group "root"
  end
  template "#{node[:mediawiki][:installation_directory]}/includes/installer/Installer.php" do
    source "Installer.php.erb"
    mode "0644"
  end
elsif node[:mediawiki][:mw_version] = '1.18.4'
  log "Template config: Using template LocalSettings.php.118.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
    source "LocalSettings.php.118.erb"
    mode "0644"
    owner "root"
    group "root"
  end
  else
    log "Unknown MediaWiki version.  This error should never happen."
end

rightscale_marker :end
