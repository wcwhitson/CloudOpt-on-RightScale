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
    sys_firewall "9001"
    sys_firewall "9002"
    sys_firewall "9003"
    if node[:cloudoptimizer_packages][:additional][:cloudoptimizerwebui] == 'Install'
      sys_firewall "8000"
    end
  end
  log "Firewall rules: Ending"
end