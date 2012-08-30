################################################################################
# Install mysql-proxy
################################################################################
# Install the mysql-proxy package if selected by input.  mysql-proxy is the
# simplest way to intercept MySQL replication traffic when CloudOptimizer is
# installed as a gateway.
################################################################################
log "Install mysql-proxy: Starting"
if node[:cloudoptimizer_packages][:optional][:mysql_proxy] == 'Install'
  log "Install mysql-proxy: Installing mysql-proxy."
  package "mysql-proxy"
end
log "Install mysql-proxy: Ending"