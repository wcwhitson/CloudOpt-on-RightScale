################################################################################
# Install frox
################################################################################
# Install the frox package if selected by input.  frox is a plain FTP proxy and
# can be used with FTP clients that don't support FTP over HTTP.
################################################################################
log "Install frox: Starting"
if node[:cloudoptimizer_packages][:optional][:frox] == 'Install'
  log "Install frox: Installing frox."
  package "frox"
end
log "Install frox: Ending"