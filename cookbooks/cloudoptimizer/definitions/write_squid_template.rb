################################################################################
# write_squid_template.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Build the squid config file from template
################################################################################

define :write_squid_template do
  log "Template config: Starting"
  log "Template config: Using template squid.conf.erb."
  template "/etc/squid/squid.conf" do
    source "squid.conf.erb"
    mode "0644"
    owner "root"
    group "root"
  end
  log "Template config: Ending"
end