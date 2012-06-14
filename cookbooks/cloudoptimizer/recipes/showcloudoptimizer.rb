##
# Cookbook Name: Show CloudOptimizer Configuration 
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

log "========== Retrieving CloudOptimizer Configuration  =========="

log "--------------------------------------------------------------"
log "CLOUDOPTIMIZER VERSION:"
execute "service" do
        command "service cloudoptimizer show-version"
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "HOME DIRECTORY:"
execute "cloudconfig" do
  command "cloudconfig get /config/home"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CACHE SIZE:"
execute "cloudconfig" do
  command "cloudconfig get /config/default_cache_size"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKET LOCATION:"
execute "cloudconfig" do
  command "cloudconfig get /config/socket_location"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "BITMAP SIZE:"
execute "cloudconfig" do
  command "cloudconfig get /config/bitmap_size"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "DB MEMORY SIZE:"
execute "cloudconfig" do
  command "cloudconfig get /config/db_memory_size"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOG DIRECTORY:"
execute "cloudconfig" do
  command "cloudconfig get /config/log_dir"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOG KEY:"
execute "cloudconfig" do
  command "cloudconfig get /config/log_key"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESSION ENGINE:"
execute "cloudconfig" do
  command "cloudconfig get /config/compression_engine"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESSION LEVEL:"
execute "cloudconfig" do
  command "cloudconfig get /config/default_compression_level"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "OPTIMISTIC DEDUPLICATION:"
execute "cloudconfig" do
  command "cloudconfig get /config/optimistic_deduplication"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CACHE PROMOTION:"
execute "cloudconfig" do
  command "cloudconfig get /config/cache_promotion"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "COMPRESS CACHE:"
execute "cloudconfig" do
  command "cloudconfig get /config/compress_cache"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "THREAD COUNT:"
execute "cloudconfig" do
  command "cloudconfig get /config/thread_count"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "INTELLIGENT MESH:"
execute "cloudconfig" do
  command "cloudconfig get /config/intelligent_mesh"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "LOCAL PROXY ADDRESS:"
execute "cloudconfig" do
  command "cloudconfig get /config/local_proxy_address"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEER PROXY PORT:"
execute "cloudconfig" do
  command "cloudconfig get /config/peer_proxy_port"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "ENABLE SOCKS:"
execute "cloudconfig" do
  command "cloudconfig get /config/enable_socks"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKS PROXY PORT:"
execute "cloudconfig" do
  command "cloudconfig get /config/socks_proxy_port"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOCKS USERNAME:"
execute "cloudconfig" do
  command "cloudconfig get /config/socks_username"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOURCE TRANSPARENCY:"
execute "cloudconfig" do
  command "cloudconfig get /config/source_transparency"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SOURCE REMAP:"
execute "cloudconfig" do
  command "cloudconfig get /config/source_remap"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEER ENCRYPTION:"
execute "cloudconfig" do
  command "cloudconfig get /config/peer_encryption"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL KEY:"
execute "cloudconfig" do
  command "cloudconfig get /config/ssl_key"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL CERT:"
execute "cloudconfig" do
  command "cloudconfig get /config/ssl_cert"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "SSL CA:"
execute "cloudconfig" do
  command "cloudconfig get /config/ssl_ca"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "PEERS:"
execute "cloudconfig" do
  command "cloudconfig peer_list"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "TERMINATE SSL:"
execute "cloudconfig" do
  command "cloudconfig get /config/terminate_ssl"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "VERIFY UPSTREAM CERTIFICATE:"
execute "cloudconfig" do
  command "cloudconfig get /config/verify_upstream_certificate"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "CIFS OPTIMIZATION:"
execute "cloudconfig" do
  command "cloudconfig get /config/optimize_cifs"
  returns [0, 1]
end
log "--------------------------------------------------------------"

log "--------------------------------------------------------------"
log "VERIFY UPSTREAM CERTIFICATE:"
execute "cloudconfig" do
  command "cloudconfig get /config/verify_upstream_certificate"
  returns [0, 1]
end
log "--------------------------------------------------------------"

rs_utils_marker :end
