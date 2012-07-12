################################################################################
# Install WebUI
################################################################################
# Install the cloudoptimizer-webui package if selected by input.  Starting in
# version 1.1.5, enable by default.
################################################################################
log "Install WebUI: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
  log "Install WebUI: Installing cloudoptimizer-webui package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-webui"
    end
  else
    package "cloudoptimizer-webui"
  end
end
log "Install WebUI: Ending"