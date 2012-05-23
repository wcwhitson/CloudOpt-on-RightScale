#
# Cookbook Name: Add Security Group 
#
# Copyright CloudOpt, Inc.  All rights reserved.

require 'ec2'

log "========== Beginning Add Security Group  =========="

if node[:cloudoptimizer][:security][:securitygroup] == "Open CloudOptimizer Ports"
  cloudopt_group = ec2.security_groups.create('cloudoptimizer')
  cloudopt_group.authorize_ingress(:tcp, 9001..9003)
end

log "========== Ending Add Security Group  =========="

