################################################################################
# mediawiki_update_settings.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# This recipe will update MediaWiki settings, other than the database settings.
# If you need to change database settings, you might as well just run
# mediawiki_first_time_config again.
#
# Be careful with this.  You can break your MediaWiki config if you don't know
# what you are doing.
################################################################################

rightscale_marker :begin

################################################################################
# Get values from the existing LocalSettings.php
################################################################################
# Use getmwconfig.php to pull configuration settings from the running
# LocalSettings.php file.
################################################################################

ruby_block "get_auto_config" do
  block do
    node[:mediawiki][:namespace] = `php /usr/bin/getmwconfig.php wgMetaNamespace #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
    node[:mediawiki][:secret_key] = `php /usr/bin/getmwconfig.php wgSecretKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
    node[:mediawiki][:upgrade_key] = `php /usr/bin/getmwconfig.php wgUpgradeKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
    node[:mediawiki][:db_type] = `php /usr/bin/getmwconfig.php wgDBtype #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
    node[:mediawiki][:db_name] = `php /usr/bin/getmwconfig.php wgDBname #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}`
  end
  action :create
end

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
