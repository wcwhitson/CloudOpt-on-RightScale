################################################################################
# cloudoptimizer_install.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# First time installation and configuration of CloudOptimizer
################################################################################

rightscale_marker :begin

#require 'rubygems'

#g = gem_package "right_aws" do
#  action :nothing
#end
#g.run_action(:install)
 
#Gem.clear_paths

#user_feedback
#fix_syslogng
#accept_eula
#install_keys
#add_cache_volume
#add_cloudopt_repos
#open_cloudoptimizer_ports
#install_python26
#create_home_directory
#create_log_directory
#install_cloudoptimizer_package
#install_cloudcontroller_package
#install_cloudoptimizer_tools_package
#install_cloudoptimizer_webui
#configure_transparent_proxy
#write_configuration_template
#add_peers_and_endpoints
#get_configuration_stored
#restart_cloudoptimizer

rightscale_marker :end
