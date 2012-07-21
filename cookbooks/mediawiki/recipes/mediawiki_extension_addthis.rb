################################################################################
# mediawiki_extension_addthis.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure ths AddThis MediaWiki extension.
################################################################################

rightscale_marker :begin

################################################################################
# Install extension
################################################################################
# 
################################################################################
log "Install Extension AddThis: Starting"

ext_name = "AddThis"

install_dir = "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:extensions_dir]}/#{ext_name}"
  
directory install_dir do
  action :create
end

git install_dir do
  repository "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/AddThis.git"
  action :checkout
end

log "Install Extension AddThis: Ending"


################################################################################
# Build configuration from templates
################################################################################
# Build LocalSettings.php from inputs.
################################################################################
log "Template config: Starting"

log "Template config: Using template AddThisSettings.php.erb."
template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
  source "AddThisSettings.php.erb"
  mode "0644"
  owner "root"
  group "root"
end


################################################################################
# Update the MediaWiki configuration
################################################################################
# Pick up the new extension
################################################################################
execute "update.php" do
  command "php #{node[:mediawiki][:installation_directory]}/maintenance/update.php"
end

rightscale_marker :end
