#
# Cookbook Name: Show CloudOptimizer Configuration 
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Retrieving CloudOptimizer Configuration  =========="

execute "cloudconfig" do
	command "cloudconfig get /config/home"
end

execute "cloudconfig" do
        command "cloudconfig get /config/default_cache_size"
end

execute "cloudconfig" do
        command "cloudconfig get /config/socket_location"
end

execute "cloudconfig" do
        command "cloudconfig get /config/bitmap_size"
end

execute "cloudconfig" do
        command "cloudconfig get /config/db_memory_size"
end

execute "cloudconfig" do
        command "cloudconfig get /config/log_dir"
end

execute "cloudconfig" do
        command "cloudconfig get /config/log_key"
end

execute "cloudconfig" do
        command "cloudconfig get /config/compression_engine"
end

execute "cloudconfig" do
        command "cloudconfig get /config/default_compression_level"
end

execute "cloudconfig" do
        command "cloudconfig get /config/optimistic_deduplication"
end

execute "cloudconfig" do
        command "cloudconfig get /config/cache_promotion"
end

execute "cloudconfig" do
        command "cloudconfig get /config/compress_cache"
end

execute "cloudconfig" do
        command "cloudconfig get /config/thread_count"
end

execute "cloudconfig" do
        command "cloudconfig get /config/intelligent_mesh"
end

execute "cloudconfig" do
        command "cloudconfig get /config/local_proxy_address"
end

execute "cloudconfig" do
        command "cloudconfig get /config/peer_proxy_port"
end

execute "cloudconfig" do
        command "cloudconfig get /config/enable_socks"
end

execute "cloudconfig" do
        command "cloudconfig get /config/socks_proxy_port"
end

execute "cloudconfig" do
        command "cloudconfig get /config/socks_username"
end

execute "cloudconfig" do
        command "cloudconfig get /config/source_transparency"
end

execute "cloudconfig" do
        command "cloudconfig get /config/source_remap"
end

execute "cloudconfig" do
        command "cloudconfig get /config/peer_encryption"
end

execute "cloudconfig" do
        command "cloudconfig get /config/ssl_key"
end

execute "cloudconfig" do
        command "cloudconfig get /config/ssl_cert"
end

execute "cloudconfig" do
        command "cloudconfig get /config/ssl_ca"
end

execute "cloudconfig" do
        command "cloudconfig get /config/peers"
end

execute "cloudconfig" do
        command "cloudconfig get /config/terminate_ssl"
end

execute "cloudconfig" do
        command "cloudconfig get /config/verify_upstream_certificate"
end

execute "service" do
	command "service cloudoptimizer show-version"
end

log "========== Ending CloudOptimizer Configuration Retrieval =========="
