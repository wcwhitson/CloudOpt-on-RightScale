################################################################################
# cloudoptimizer_upgrade.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Upgrade the CloudOptimizer packages
################################################################################

rightscale_marker :begin

if node[:cloudoptimizer][:version] != 'latest'
  log "ERROR: The Version Lock input must be set to 'latest' in order to upgrade CloudOptimizer."
  exit
end
  
# Save the existing configuration
execute "mv" do
  command "mv /etc/cloudoptimizer.conf /var/tmp/cloudoptimizer.conf.pre-upgrade"
end

# Add CloudOpt repos, just in case they have changed since the last version was installed
if node[:platform] == 'centos'
  # Replace the RightScale custom EPEL repo with the standard EPEL repo
  fix_epel_repos
end
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  add_cloudopt_test_repos
else
  add_cloudopt_repos
end

# Upgrade CloudOptimizer Tools
upgrade_cloudoptimizer_tools_package

# Upgrade CloudOptimizer
upgrade_cloudoptimizer_package

# Upgrade CloudController
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  upgrade_cloudcontroller_package
end

# Upgrade WebUI
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  upgrade_cloudoptimizer_webui_package
end


if node[:platform] == 'centos'
  # Restore the RightScale custom EPEL repos
  unfix_epel_repos
end

# Restore the existing configuration
execute "mv" do
  command "mv /etc/cloudoptimizer.conf /etc/cloudoptimizer.conf.upgrade"
end
execute "mv" do
  command "mv /var/tmp/cloudoptimizer.conf.pre-upgrade /etc/cloudoptimizer.conf"
end

# Restart to pick up config
restart_cloudoptimizer

rightscale_marker :end
