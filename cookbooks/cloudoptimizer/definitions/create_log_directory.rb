################################################################################
# Create alternate log directory
################################################################################
# If the user has specified a different log directory than the default, create
# the directory and set ownership and permissions.
################################################################################
# Create alternate log directory
log "Create log dir: Starting"
unless node[:cloudoptimizer_configuration][:logs][:log_directory] == "/var/log/cloudoptimizer"
  log "Create log dir: Creating input-specified CloudOptimizer log directory."
  directory node[:cloudoptimizer_configuration][:logs][:log_directory] do
    owner "root"
    group "root"
    mode "0700"
    action :create
  end
  directory "/var/log/cloudoptimizer" do
    recursive true
    action :delete
  end
end
log "Create log dir: Ending"