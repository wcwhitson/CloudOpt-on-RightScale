################################################################################
# mediawiki_first_time_config.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# First time build of the MediaWiki database.  This should be run as an
# operational script following first time installation.
################################################################################

rightscale_marker :begin

################################################################################
# Build the database
################################################################################
# This calls the MediaWiki command line installer with arguments from inputs.
################################################################################

log "Configure MediaWiki: Starting"
execute "install.php" do
 command "php #{node[:mediawiki][:installation_directory]}/maintenance/install.php \
  --dbname #{node[:mediawiki][:db_name]} \
  --dbprefix #{node[:mediawiki][:db_prefix]} \
  --dbserver #{node[:mediawiki][:db_server_address]} \
  --dbtype #{node[:mediawiki][:db_type]} \
  --dbuser #{node[:mediawiki][:db_user_account]} \
  --dbpass #{node[:mediawiki][:db_user_password]} \
  --installdbpass #{node[:mediawiki][:db_root_password]} \
  --installdbuser #{node[:mediawiki][:db_root_account]} \
  --admin #{node[:mediawiki][:mediawiki_admin_account]} \
  --pass #{node[:mediawiki][:mediawiki_admin_password]} \
  --email #{node[:mediawiki][:admin_email]} \
  --scriptpath #{node[:mediawiki][:installation_directory]} \ 
  --name #{node[:mediawiki][:site_name]} \
  --confpath /var/tmp"
end
log "Configure MediaWiki: Ending"

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

# Set default namespace
node[:mediawiki][:namespace_default] = node[:mediawiki][:site_name].gsub(" ", "_")
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
  variables(
    node[:mediawiki][:namespace_default]
  )
end

rightscale_marker :end
