################################################################################
# Install stored configurations
################################################################################
# Here we give the user the option to retrieve stored configuration files for a 
# truly persistent CloudOptimizer installation that can be stopped and started 
# without requiring reconfiguration.  Files must be provided on an unprotected 
# HTTP server.

# Stored configuration files take precedence over all other configuration.  
# Thus, if the user sets individual configuration options, but also specifies a 
# stored config file, the individual configuration options will be ignored.
################################################################################
# Stored CloudOptimizer configuration file
log "Stored configs: Starting"
if node[:cloudoptimizer][:stored_configuration][:cloudoptimizer] == 'none'
  log "Stored configs: No stored cloudoptimizer configuration specified."
else
  log "Stored configs: Installing saved cloudoptimizer configuration from: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}"
  remote_file "/etc/cloudoptimizer.conf" do
    source node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]
    owner "root"
    group "root"
    mode "0644"
  end
end