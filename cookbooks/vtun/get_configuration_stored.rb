# Stored vtun configuration file
if node[:cloudoptimizer][:stored_configuration][:vtun] == 'none'
  log "Stored configs: No stored vtun configuration specified."
else
  log "Stored configs: Installing saved vtun configuration from: #{node[:cloudoptimizer][:stored_configuration][:vtun]}"
  remote_file "/etc/vtund.conf" do
    source node[:cloudoptimizer][:stored_configuration][:vtun]
    owner "root"
    group "root"
    mode "0644"
  end
end
log "Stored configs: Ending"