################################################################################
# cloudoptimizer_show.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Display CloudOptimizer configuration in the RightScale audit log
################################################################################

rightscale_marker :begin

log "========== Retrieving CloudOptimizer Configuration  =========="

log "--------------------------------------------------------------"
log "CLOUDOPTIMIZER VERSION:"
get_version
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "HOME DIRECTORY:"
get_cloudconfig "home" do
  setting "/config/home"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CACHE SIZE:"
get_cloudconfig "default_cache_size" do
  setting "/config/default_cache_size"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKET LOCATION:"
get_cloudconfig "socket_location" do
  setting "/config/socket_location"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOG DIRECTORY:"
get_cloudconfig "log_dir" do
  setting "/config/log_dir"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOG KEY:"
get_cloudconfig "log_key" do
  setting "/config/log_key"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESSION ENGINE:"
get_cloudconfig "compression_engine" do
  setting "/config/compression_engine"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESSION LEVEL:"
get_cloudconfig "compression_level" do
  setting "/config/compression_level"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "OPTIMISTIC DEDUPLICATION:"
get_cloudconfig "optimistic_deduplication" do
  setting "/config/optimistic_deduplication"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CACHE PROMOTION:"
get_cloudconfig "cache_promotion" do
  setting "/config/cache_promotion"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESS CACHE:"
get_cloudconfig "compress_cache" do
  setting "/config/compress_cache"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "THREAD COUNT:"
get_cloudconfig "thread_count" do
  setting "/config/thread_count"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "INTELLIGENT MESH:"
get_cloudconfig "intelligent_mesh" do
  setting "/config/intelligent_mesh"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOCAL PROXY ADDRESS:"
get_cloudconfig "local_proxy_address" do
  setting "/config/local_proxy_address"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEER PROXY PORT:"
get_cloudconfig "peer_proxy_port" do
  setting "/config/peer_proxy_port"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "ENABLE SOCKS:"
get_cloudconfig "enable_socks" do
  setting "/config/enable_socks"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKS PROXY PORT:"
get_cloudconfig "socks_proxy_port" do
  setting "/config/socks_proxy_port"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKS USERNAME:"
get_cloudconfig "socks_username" do
  setting "/config/socks_username"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOURCE TRANSPARENCY:"
get_cloudconfig "source_transparency" do
  setting "/config/source_transparency"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOURCE REMAP:"
get_cloudconfig "source_remap" do
  setting "/config/source_remap"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEER ENCRYPTION:"
get_cloudconfig "peer_encryption" do
  setting "/config/peer_encryption"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL KEY:"
get_cloudconfig "ssl_key" do
  setting "/config/ssk_key"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL CERT:"
get_cloudconfig "ssl_cert" do
  setting "/config/ssl_cert"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL CA:"
get_cloudconfig "ssl_ca" do
  setting "/config/ssl_ca"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEERS:"
get_peers
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "TERMINATE SSL:"
get_cloudconfig "terminate_ssl" do
  setting "/config/terminate_ssl"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "VERIFY UPSTREAM CERTIFICATE:"
get_cloudconfig "verify_upstream" do
  setting "/config/verify_upstream"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CIFS OPTIMIZATION:"
get_cloudconfig "cifs_optimization" do
  setting "/config/cifs_optimization"
end
log "--------------------------------------------------------------"

log "============ End of CloudOptimizer Configuration  ============"

rightscale_marker :end
