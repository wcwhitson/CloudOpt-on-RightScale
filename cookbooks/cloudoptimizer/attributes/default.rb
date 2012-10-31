##
# CloudOptimizer attributes
#
# Copyright CloudOpt, Inc.  All rights reserved.

set[:cloudoptimizer][:defaults][:current_version] = '1.2.1'
set[:cloudoptimizer][:defaults][:previous_version_1] = '1.2.0'
set[:cloudoptimizer][:defaults][:previous_version_2] = '1.1.7'
set[:cloudoptimizer][:defaults][:previous_version_3] = '1.1.5'
set[:cloudoptimizer][:defaults][:previous_version_4] = '1.1.5'

set[:cloudoptimizer][:defaults][:vendor_name] = "CloudOpt"
set[:cloudoptimizer][:defaults][:product_name] = "CloudOptimizer"
set[:cloudoptimizer][:defaults][:feedback_address] = 'autofeedback@cloudopt.com'
  
set[:cloudoptimizer][:defaults][:config_dir] = '/etc/cloudoptimizer'
set[:cloudoptimizer][:defaults][:config_file_path] = '/etc'
set[:cloudoptimizer][:defaults][:config_file_name] = 'cloudoptimizer.conf'

set[:cloudoptimizer][:defaults][:test_repo_ubuntu] = '50.16.207.155'
set[:cloudoptimizer][:defaults][:test_repo_centos] = '50.16.196.194'
set[:cloudoptimizer][:defaults][:main_repo_ubuntu] = 'apt.cloudopt.com'
set[:cloudoptimizer][:defaults][:archive_repo_ubuntu] = 'rightscale.cloudopt.com.s3-website-us-east-1.amazonaws.com'
set[:cloudoptimizer][:defaults][:main_repo_centos] = 'yum.cloudopt.com'

set[:cloudoptimizer][:defaults][:webui_port] = "8000"
  
set[:cloudoptimizer][:defaults][:home_dir] = '/home/cloudoptimizer'
set[:cloudoptimizer][:defaults][:log_dir] = '/var/log/cloudoptimizer'
  
set[:cloudoptimizer][:defaults][:epel_5_repo] = 'http://mirrors.servercentral.net/fedora/epel/5/i386/epel-release-5-4.noarch.rpm'
set[:cloudoptimizer][:defaults][:epel_6_repo] = 'http://fedora-epel.mirror.lstn.net/6/i386/epel-release-6-7.noarch.rpm'
set[:cloudoptimizer][:defaults][:compatible_collectd_mysql] = 'ftp://ftp.sunet.se/pub/Linux/distributions/fedora/epel/epel/5/x86_64/collectd-mysql-4.10.0-4.el5.x86_64.rpm'