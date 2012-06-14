##
# Cookbook Name: Add Security Group 
#
# Copyright CloudOpt, Inc.  All rights reserved.

require 'right_aws'

rs_utils_marker :begin

if node[:cloudoptimizer][:security][:securitygroup] == "Open ports"
  # Create group
  @group = 'CloudOptimizer'
  @ec2.create_security_group(@group,'CloudOptimizer proxy and tunnel ports')
  group = @ec2.describe_security_groups([@group])[0]
  # Add ports
  @ec2.authorize_security_group_named_ingress(@group, account_number, 'default')
@ec2.authorize_security_group_IP_ingress(@group, 9001,9001,'tcp','0.0.0.0/0')
end

rs_utils_marker :end

