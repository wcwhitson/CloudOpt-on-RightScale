################################################################################
# Install firewall rules
################################################################################
# This opens the CloudOptimizer ports in iptables.  This step is required for 
# RackSpace instances and should do no harm on others.
################################################################################
log "Firewall rules: Starting"
log "Modifying firewall rules to allow CloudOptimizer ports."
if node[:sys_firewall][:enabled] == "enabled"
  include_recipe "iptables"
  sys_firewall "9001"
  sys_firewall "9002"
  sys_firewall "9003"
end
log "Firewall rules: Ending"