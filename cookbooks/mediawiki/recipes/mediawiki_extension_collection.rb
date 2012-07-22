################################################################################
# mediawiki_extension_collection.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the Collection MediaWiki extension.
################################################################################

rightscale_marker :begin

################################################################################
# Install extension
################################################################################
# 
################################################################################
log "Install Extension Collection: Starting"

ext_name = "AddThis"

install_dir = "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:extensions_dir]}/#{ext_name}"
  
directory install_dir do
  action :create
end

git install_dir do
  repository "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/Collection.git"
  action :checkout
end

log "Install Extension Collection: Ending"


################################################################################
# Build configuration from templates
################################################################################
# Build LocalSettings.php from inputs.
################################################################################
log "Template config: Starting"

log "Template config: Using template AddThisSettings.php.erb."
template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/CollectionSettings.php" do
  source "CollectionSettings.php.erb"
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
