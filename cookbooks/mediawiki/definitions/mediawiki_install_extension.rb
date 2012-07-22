################################################################################
# mediawiki_install_extension.rb
################################################################################
# Chef definition, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure MediaWiki extensions
################################################################################

define :mediawiki_install_extension do

  ################################################################################
  # Install extension
  ################################################################################
  # 
  ################################################################################
  log "Install Extension #{params[:name]}: Starting"

  ext_name = "#{params[:name]}"

  install_dir = "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:extensions_dir]}/#{ext_name}"
  
  directory install_dir do
    action :create
  end

  git install_dir do
    repository "#{params[:repo]}"
    action :checkout
  end

  log "Install Extension #{params[:name]}: Ending"


  ################################################################################
  # Build configuration from templates
  ################################################################################
  # Build LocalSettings.php from inputs.
  ################################################################################
  log "Template config for #{params[:name]}: Starting"
  
  log "Template config: Using template AddThisSettings.php.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/#{params[:name]}Settings.php" do
    source "#{params[:name]}Settings.php.erb"
    mode "0644"
    owner "root"
    group "root"
  end

  log "Template config for #{params[:name]}: Ending"
  
  ################################################################################
  # Update the MediaWiki configuration
  ################################################################################
  # Pick up the new extension
  ################################################################################
  execute "update.php" do
    command "php #{node[:mediawiki][:installation_directory]}/maintenance/update.php"
  end

end
