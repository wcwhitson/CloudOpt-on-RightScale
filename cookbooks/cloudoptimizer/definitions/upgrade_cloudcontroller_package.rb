################################################################################
# upgrade_cloudcontroller_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Upgrade the cloudoptimizer-s3 package
################################################################################

define :upgrade_cloudcontroller_package do
  log "Upgrade cloudoptimizer-s3: Starting"
  if node[:cloudoptimizer][:version] == 'latest'
    package "cloudoptimizer-s3" do
      action :upgrade
    end
  else
    log "ERROR: Updater was called but version lock is not set to 'latest'.  This should never happen."
  end
  log "Upgrade cloudoptimizer-s3: Ending"
end