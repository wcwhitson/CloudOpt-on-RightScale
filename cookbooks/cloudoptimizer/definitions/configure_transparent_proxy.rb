################################################################################
# configure_transparent_proxy.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Get the first public and private IP addresses and use them as the default
# values for the transparent proxy mapping unless the user has chosen to enter
# addresses manually.
#
# This only sets the default values for the proxy mapping; it does not actually
# enable transparent proxying.
################################################################################

define :configure_transparent_proxy do
  log "Transparent mapping: Starting"
  if node[:cloudoptimizer_configuration][:transparency][:transp_intip] == 'First private IP address'
    log "Transparent mapping: Setting internal IP address to #{node[:cloud][:private_ips][0]}"
    node[:cloudoptimizer_configuration][:transparency][:transp_intip] = node[:cloud][:private_ips][0]
  else
    log "Transparent mapping: Setting internal IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}"
  end
  # Set the public/external IP address
  if node[:cloudoptimizer_configuration][:transparency][:transp_extip] == 'First public IP address'
    log "Transparent mapping: Setting external IP address to: #{node[:cloud][:public_ips][0]}"
    node[:cloudoptimizer_configuration][:transparency][:transp_extip] = node[:cloud][:public_ips][0]
  else
    log "Transparent mapping: Setting external IP address to user specified: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}"
  end
  log "Transparent mapping: Ending"
end