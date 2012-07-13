##
# CloudOptimizer attributes
#
# Copyright CloudOpt, Inc.  All rights reserved.

set[:cloudoptimizer][:current_version] = '1.1.6'

set[:cloudoptimizer][:vendor_name] = "CloudOpt"
set[:cloudoptimizer][:product_name] = "CloudOptimizer"
set[:cloudoptimizer][:feedback_address] = 'bill@cloudopt.com'
#set[:cloudoptimizer][:feedback_address] = 'autofeedback@cloudopt.com'
  
set[:cloudoptimizer][:config_dir] = '/etc/cloudoptimizer'
set[:cloudoptimizer][:config_file_path] = '/etc'
set[:cloudoptimizer][:config_file_name] = 'cloudoptimizer.conf'

set[:cloudoptimizer][:test_repo_ubuntu] = '50.16.207.155'
set[:cloudoptimizer][:test_repo_centos] = '50.16.196.194'
set[:cloudoptimizer][:main_repo_ubuntu] = 'apt.cloudopt.com'
set[:cloudoptimizer][:main_repo_centos] = 's3.amazonaws.com/rpm-cloudopt'

set[:cloudoptimizer][:webui_port] = "8000"
