################################################################################
# Set transparent proxy address mappings
################################################################################
# Get the first public and private IP addresses and use them as the default
# values for the transparent proxy mapping unless the user has chosen to enter
# addresses manually.
################################################################################
log "Transparent mapping: Starting"
if node[:cloudoptimizer_configuration][:transparency][:transp_intip] == 'First private IP address'
  log "Transparent mapping: Setting internal IP address to #{node[:cloud][:private_ips][0]}"
  $internal_ip = node[:cloud][:private_ips][0]
else
  log "Transparent mapping: Setting internal IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}"
  $internal_ip = node[:cloudoptimizer_configuration][:transparency][:transp_intip]
end
# Set the public/external IP address
if node[:cloudoptimizer_configuration][:transparency][:transp_extip] == 'First public IP address'
  log "Transparent mapping: Setting external IP address to: #{node[:cloud][:public_ips][0]}"
  $external_ip = node[:cloud][:public_ips][0]
else
  log "Transparent mapping: Setting external IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}"
  $external_ip = node[:cloudoptimizer_configuration][:transparency][:transp_extip]
end
log "Transparent mapping: Ending"