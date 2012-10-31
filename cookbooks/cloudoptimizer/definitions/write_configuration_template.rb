################################################################################
# write_configuration_template.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# We use chef templates to build the configuration file.  When new options are 
# added to the configuration file, we must add a new template to match.  When 
# multiple versions of the configuration file are supported at the same time, we
# must determine the CloudOptimizer version that we are installing and use the 
# appropriate template for that version.
################################################################################

define :write_configuration_template do
  log "Template config: Starting"
  log "Template config: CloudOptimizer version: #{node[:cloudoptimizer][:version]}"
  if node[:cloudoptimizer][:version] == '0.9.4'
    log "Template config: Using template cloudoptimizer.conf.0.9.4.erb."
    template "#{node[:cloudoptimizer][:defaults][:config_file_path]}/#{node[:cloudoptimizer][:defaults][:config_file_name]}" do
      source "cloudoptimizer.conf.0.9.4.erb"
      mode "0644"
      owner "root"
      group "root"
    end
  else
    log "Template config: Using template cloudoptimizer.conf.erb."
    template "#{node[:cloudoptimizer][:defaults][:config_file_path]}/#{node[:cloudoptimizer][:defaults][:config_file_name]}" do
      source "cloudoptimizer.conf.erb"
      mode "0644"
      owner "root"
      group "root"
    end
  end
  log "Template config: Ending"
end