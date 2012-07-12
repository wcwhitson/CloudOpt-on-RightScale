################################################################################
# Install vtun
################################################################################
# Install the vtun package if selected by input.  vtun is commonly used to
# tunnel traffic to CloudOptimizer for interception.
################################################################################
log "Install vtun: Starting"
if node[:cloudoptimizer_packages][:optional][:vtun] == 'Install'
  log "Install vtun: Installing vtun."
  package "vtun"
end
log "Install vtun: Ending"