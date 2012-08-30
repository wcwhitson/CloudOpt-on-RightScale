################################################################################
# uograde_cloudoptimizer_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Upgrade the cloudoptimizer package
################################################################################

define :upgrade_cloudoptimizer_package do
  log "Upgrade cloudoptimizer: Starting"
  if node[:cloudoptimizer][:version] == 'latest'
    package "cloudoptimizer" do
      action :upgrade
    end
  else
    log "ERROR: Updater was called but version lock is not set to 'latest'.  This should never happen."
  end
  log "Upgrade cloudoptimizer: Ending"
end