#
# Cookbook Name: CloudOpt Setup Mail
#
# Copyright CloudOpt, Inc.  All rights reserved.

rs_utils_marker :begin

# Install postfix

p = package "postfix" do
  action :nothing
end
 
p.run_action(:install)

# Change default MTA to postfix.
execute "MTA default" do
  command "alternatives --set mta /usr/sbin/sendmail.postfix"
end

if node[:platform] == "centos"
  s = service "postfix" do
    action :start
  end
  s.run_action(:start)
else
  r = service "postfix" do
    action :restart
  end
  r.run_action(:restart)
end

rs_utils_marker :end