################################################################################
# install_cloudoptimizer_webui_package.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Upgrade the cloudoptimizer-webui package
################################################################################

define :install_cloudoptimizer_webui_package do
  log "Install cloudoptimizer-webui: Starting"
  if node[:cloudoptimizer][:version] == 'latest'
    package "cloudoptimizer-webui" do
      action :install
    end
  else
    log "ERROR: Updater was called but version lock is not set to 'latest'.  This should never happen."
  end
  log "Install cloudoptimizer-webui: Ending"
end