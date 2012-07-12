################################################################################
# Install CloudController
################################################################################
# Install the cloudoptimizer-s3 package if selected by input
################################################################################
log "Install CloudController: Starting"
if node[:cloudoptimizer_packages][:additional][:cloudoptimizers3] == 'Install'
  log "Install CloudController: Installing cloudoptimizer-s3 package."
  if node[:platform] == 'centos'
    execute "yum" do
      command "yum -y install cloudoptimizer-s3"
    end
  else
    package "cloudoptimizer-s3"
  end
end
log "Install CloudController: Ending"