################################################################################
# accept_eula.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# The CloudOptimizer package install script must find that the EULA has already 
# been accepted or it will wait for user input, causing the RightScale instance 
# to strand.  This script creates the EULA acceptance file.
################################################################################

define :accept_eula do
  log "Accept EULA: Starting"

  # Create the Cloudoptimizer config directory.  This is normally created by the 
  # installer, but the installer requires that it already exist to contain the 
  # EULA acceptance file, we must create it before the installer runs.
  create_config_directory

  # Create the EULA acceptance file.
  log "Creating EULA acceptance files."

  # For whatever reason, the Ubuntu and CentOS installers check different EULA
  # files.  At some point the CentOS file was changed, while the Ubuntu file
  # remained the same.  We just create both, as a hedge against future changes
  # that would appear on upgrade and require reacceptance of the EULA.
  
  # Ubuntu
  log "EULA: Creating Ubuntu / old style EULA acceptance file."
  file "#{node[:cloudoptimizer][:defaults][:config_dir]}/accept-eula.txt" do
    owner "root"
    group "root"
    mode "0755"
    content "true"
    action :create
  end

  # CentOS
  log "EULA: Creating CentOS / new style EULA acceptance file."
  file "#{node[:cloudoptimizer][:defaults][:config_dir]}/accepted-cloudoptimizer-eula" do
    owner "root"
    group "root"
    mode "0755"
    content "true"
    action :create
  end
  log "Accept EULA: Ending"
end