################################################################################
# Restart cloudoptimizer
################################################################################
# Restart to pick up all the configuration changes.
################################################################################
log "Final restart: Starting"
service "cloudoptimizer" do
  action :restart
end
log "Final restart: Ending"