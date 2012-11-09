################################################################################
# user_feedback.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Unless the user disables feedback, collect those configuration settings that
# don't reveal any customer-specific information and mail a report.
################################################################################

define :user_feedback do
  
  require 'rubygems'
  
  log "Feedback: Starting"
  # Install pony for mail support
  g = gem_package "pony" do
    action :nothing
  end
  g.run_action(:install)
 
  Gem.clear_paths
  require 'pony'

  if node[:platform] == 'centos' && node[:platform_version] != '5.8'
    pony_args = ''
  else
    pony_args = '-t'
  end

  st_name = File.read("/var/tmp/st_name")

  # Provide automatic feedback to cloudopt
  if node[:cloudoptimizer][:user_feedback] == "Detailed feedback"
    log "Feedback Sending detailed feedback."
    mail_body = Array.new
    mail_body << "Server Template: #{st_name}<br />"
    mail_body << "Cookbook: #{self.cookbook_name}<br />"
    mail_body << "Recipe: #{self.recipe_name}<br />"
    mail_body << "Platform: #{node[:platform]}<br />"
    mail_body << "Version: #{node[:platform_version]}<br />"
    mail_body << "Uptime: #{node[:uptime]}<br />"
    mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}<br />"
    mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
    mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}<br />"
    mail_body << "Stored config: #{node[:cloudoptimizer][:stored_configuration][:cloudoptimizer]}<br />"
    mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}<br />"
    mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}<br />"
    mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}<br />"
    mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}<br />"
    mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}<br />"
    mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}<br />"
    mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}<br />"
    mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}<br />"
    mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}<br />"
    mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}<br />"
    mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}<br />"
    mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}<br />"
    mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}<br />"
    mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}<br />"
    mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}<br />"
    mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}<br />"
    mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}<br />"
    mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}<br />"
    mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}<br />"
    mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}<br />"
    mail_body << "Peer statement: #{node[:cloudoptimizer_configuration][:peer_statement]}<br />"
    mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}<br />"
    mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}<br />"
    mail_body << "SOCKS username: #{node[:cloudoptimizer_configuration][:socks][:socks_username]}<br />"
    mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}<br />"
    mail_body << "Trans internal IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_int_ip]}<br />"
    mail_body << "Trans external IP: #{node[:cloudoptimizer_configuration][:transparency][:transp_ext_ip]}<br />"
    Pony.mail(
    :to => "#{node[:cloudoptimizer][:defaults][:feedback_address]}",
    :subject => 'RightScale ServerTemplate Feedback (Detailed)',
    :headers => { 'Content-Type' => 'text/html' },
    :via_options => { :arguments => pony_args },
    :body => mail_body)
  elsif node[:cloudoptimizer][:user_feedback] == "Basic feedback"
    log "Feedback: Sending basic feedback."
    mail_body = Array.new
    mail_body << "Server Template: #{st_name}<br />"
    mail_body << "Cookbook: #{self.cookbook_name}<br />"
    mail_body << "Recipe: #{self.recipe_name}<br />"
    mail_body << "Platform: #{node[:platform]}<br />"
    mail_body << "Version: #{node[:platform_version]}<br />"
    mail_body << "Uptime: #{node[:uptime]}<br />"
    mail_body << "Architecture: #{node[:languages][:ruby][:host_cpu]}<br />"
    mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
    mail_body << "Special versions: #{node[:cloudoptimizer_packages][:special]}<br />"
    mail_body << "Home directory: #{node[:cloudoptimizer_configuration][:file_locations][:home_directory]}<br />"
    mail_body << "Cache size: #{node[:cloudoptimizer_configuration][:byte_cache][:default_cache_size]}<br />"
    mail_body << "Socket location: #{node[:cloudoptimizer_configuration][:file_locations][:socket_location]}<br />"
    mail_body << "Bitmap size: #{node[:cloudoptimizer_configuration][:byte_cache][:bitmap_size]}<br />"
    mail_body << "DB memory size: #{node[:cloudoptimizer_configuration][:byte_cache][:db_memory_size]}<br />"
    mail_body << "Log directory: #{node[:cloudoptimizer_configuration][:logs][:log_directory]}<br />"
    mail_body << "Log key: #{node[:cloudoptimizer_configuration][:logs][:log_key]}<br />"
    mail_body << "Compression engine: #{node[:cloudoptimizer_configuration][:compression][:compression_engine]}<br />"
    mail_body << "Compression level: #{node[:cloudoptimizer_configuration][:compression][:default_compression_level]}<br />"
    mail_body << "Optimistic deduplication: #{node[:cloudoptimizer_configuration][:optimistic_deduplication]}<br />"
    mail_body << "Cache promotion: #{node[:cloudoptimizer_configuration][:byte_cache][:cache_promotion]}<br />"
    mail_body << "Compress cache: #{node[:cloudoptimizer_configuration][:byte_cache][:compress_cache]}<br />"
    mail_body << "Thread count: #{node[:cloudoptimizer_configuration][:thread_count]}<br />"
    mail_body << "Intelligent mesh: #{node[:cloudoptimizer_configuration][:intelligent_mesh]}<br />"
    mail_body << "Local proxy address: #{node[:cloudoptimizer_configuration][:local_proxy_address]}<br />"
    mail_body << "Peer proxy port: #{node[:cloudoptimizer_configuration][:peer_proxy_port]}<br />"
    mail_body << "Peer encryption: #{node[:cloudoptimizer_configuration][:encryption][:peer_encryption]}<br />"
    mail_body << "SSL key: #{node[:cloudoptimizer_configuration][:encryption][:ssl_key]}<br />"
    mail_body << "SSL cert: #{node[:cloudoptimizer_configuration][:encryption][:ssl_cert]}<br />"
    mail_body << "SSL CA: #{node[:cloudoptimizer_configuration][:encryption][:ssl_ca]}<br />"
    mail_body << "SOCKS proxy: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy]}<br />"
    mail_body << "SOCKS port: #{node[:cloudoptimizer_configuration][:socks][:socks_proxy_port]}<br />"
    mail_body << "Source transparency: #{node[:cloudoptimizer_configuration][:transparency][:source_transparency]}<br />"
    Pony.mail(
    :to => "#{node[:cloudoptimizer][:defaults][:feedback_address]}",
    :subject => 'RightScale ServerTemplate Feedback (Basic)',
    :headers => { 'Content-Type' => 'text/html' },
    :via_options => { :arguments => pony_args },
    :body => mail_body)
  else
    log "Feedback: Automatic feedback disabled."
    mail_body = Array.new
    mail_body << "Server Template: #{st_name}<br />"
    mail_body << "Cookbook: #{self.cookbook_name}<br />"
    mail_body << "Recipe: #{self.recipe_name}<br />"
    mail_body << "CloudOptimizer version: #{node[:cloudoptimizer][:version]}<br />"
    Pony.mail(
    :to => "#{node[:cloudoptimizer][:defaults][:feedback_address]}",
    :subject => 'RightScale ServerTemplate Feedback (None)',
    :headers => { 'Content-Type' => 'text/html' },
    :via_options => { :arguments => pony_args },
    :body => mail_body)
  end
  log "Feedback: Ending"
end