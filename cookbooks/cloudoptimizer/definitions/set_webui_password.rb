################################################################################
# set_webui_password.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Sets the WebUI password in versions that use PAM
################################################################################

define :set_webui_password do
  log "Set WebUI password: Starting"
  execute "passwd" do
    command "echo \"#{node[:cloudoptimizer][:web_interface][:webui_passwd]}\" | passwd --stdin uiadmin"
  end
  log "Set WebUI password: Ending"
end