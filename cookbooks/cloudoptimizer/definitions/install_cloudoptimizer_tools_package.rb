################################################################################
# Install cloudoptimizer-tools
################################################################################
# Install the cloudoptimizer-tools package if selected by input.  This is not
# necessary on first install, but may be useful when cloudoptimizer-tools is
# updated separately from cloudoptimizer.
################################################################################
log "Install cloudoptimizer-tools: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizertools] == 'Install'
  log "Install cloudoptimizer-tools: Installing cloudoptimizer-tools package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-tools"
    end
  else
    package "cloudoptimizer-tools"
  end
end
log "Install cloudoptimizer-tools: Ending"