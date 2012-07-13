################################################################################
# open_cloudoptimizer_ports.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# This opens the CloudOptimizer ports in iptables.  This step is required for 
# RackSpace instances and should do no harm on others.
################################################################################

define :open_cloudoptimizer_ports do
  log "Firewall rules: Starting"
  log "Modifying firewall rules to allow CloudOptimizer ports."
  if node[:sys_firewall][:enabled] == "enabled"
    include_recipe "iptables"
    # CloudOptimizer tunnel
    log "Firewall rules: Opening port #{node[:cloudoptimizer_configuration][:local_proxy_port]}."
    sys_firewall "#{node[:cloudoptimizer_configuration][:local_proxy_port]}"
    log "Firewall rules: Opening port #{node[:cloudoptimizer_configuration][:peer_proxy_port]}."
    sys_firewall "#{node[:cloudoptimizer_configuration][:peer_proxy_port]}"
    # Squid
    if node[:cloudoptimizer_configuration][:http_proxy] == 'true'
      log "Firewall rules: Opening port #{node[:cloudoptimizer_configuration][:http_proxy_port]}."
      sys_firewall "#{node[:cloudoptimizer_configuration][:http_proxy_port]}"
    end
    # SOCKS
    if node[:cloudoptimizer_configuration][:socks][:socks_proxy] == 'true'
      log "Firewall rules: Opening port #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}."
      sys_firewall "#{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}"
    end
    #WebUI
    if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
      log "Firewall rules: Opening port #{node[:cloudoptimizer][:webui_port]}."
      sys_firewall "#{node[:cloudoptimizer][:webui_port]}"
    end
  end
  log "Firewall rules: Ending"
end