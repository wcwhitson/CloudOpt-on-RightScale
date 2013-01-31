################################################################################
# cloudoptimizer_remove.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Remove the CloudOptimizer packages
################################################################################

rightscale_marker :begin

remote_file "/var/tmp/cloudoptimizer-install.tar.gz" do
  source "http://#{node[:cloudoptimizer][:defaults][:download_site]}/#{node[:cloudoptimizer][:defaults][:installer]}"
  owner "root"
  group "root"
  mode "0755"
end

log "Unpacking CloudOptimizer installer"
execute "tar" do
  command "tar -pzxvf /var/tmp/cloudoptimizer-install.tar.gz"
end

case node[:cloudoptimizer_packages][:remove]
when "All Packages and Files"
  log "Removing all CloudOptimizer packages and files."
  execute "cloudoptimizer-install.sh" do
    command "bash /var/tmp/cloudoptimizer-install.sh --auto --quiet --purge"
  end
when "All Packages (Retain Files)"
  log "Removing all CloudOptimizer packages, but retaining configuration."
  execute "cloudoptimizer-install.sh" do
    command "bash /var/tmp/cloudoptimizer-install.sh --auto --quiet --remove"
  end
when "CloudController"
  log "Removing CloudController only."
  remove_cloudcontroller_package :remove
when "Web GUI"
  log "Removing web interface only."
  remove_cloudoptimizer_webui_package :remove
end

rightscale_marker :end

