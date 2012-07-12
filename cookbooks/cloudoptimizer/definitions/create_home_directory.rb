################################################################################
# Create alternate home directory
################################################################################
# If the user has specified a different home directory than the default, create
# the directory and set ownership and permissions.
################################################################################
log "Create home: Starting"
unless node[:cloudoptimizer_configuration][:file_locations][:home_directory] == "/home/cloudoptimizer"
  log "Create home: Creating input-specified CloudOptimizer home directory."
  directory node[:cloudoptimizer_configuration][:file_locations][:home_directory] do
    owner "cloudoptimizer"
    group "cloudoptimizer"
    mode "0711"
    action :create
  end
  directory "/home/cloudoptimizer" do
    recursive true
    action :delete
  end
end
log "Create home: Ending"