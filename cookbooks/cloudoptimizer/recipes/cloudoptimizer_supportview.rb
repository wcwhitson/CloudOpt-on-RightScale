################################################################################
# cloudoptimizer_supportview.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Create a supportview diagnostic archive and upload if requested
################################################################################

rightscale_marker :begin

case node[:cloudoptimizer][:supportview]
  when "Upload a full archive"
    execute "supportview" do
      command "supportview -u"
    end
  when "Upload a light archive"
    execute "supportview" do
      command "supportview -l"
    end
  when "Create a local archive"
    execute "supportview" do
      command "supportview"
    end
end

unless node[:cloudoptimizer][:supportview] == "Do not run SupportView"
  log "===== Beginning SupportView for RightScale Audit Log ====="

  log "HOSTNAME:"
  execute "hostname" do
    command "hostname"
  end

  log "UNAME:"
  execute "uname" do
    command "uname -a"
  end

  log "LSB_RELEASE:"
  execute "lsb_release" do
    command "lsb_release -a"
  end

  log "CPUINFO:"
  execute "cat /proc/cpuinfo" do
    command "cat /proc/cpuinfo"
  end

  log "MEMINFO:"
  execute "cat /proc/meminfo" do
    command "cat /proc/meminfo"
  end

  log "IFCONFIG:"
  execute "ifconfig" do
    command "ifconfig -a"
  end

  log "DF:"
  execute "df" do
    command "df -Ph"
  end

  log "PS:"
  execute "ps" do
    command "ps -Afly"
  end

  log "CLOUDOPTIMIZER.CONF:"
  execute "more cloudoptimizer.conf" do
    command "more /etc/cloudoptimizer.conf"
  end

  log "TOP:"
  execute "top" do
    command "top -b -n1"
  end

  log "NETSTAT:"
  show_netstat

  log "HOME_DIR:"
  show_home_dir

  log "CLOUDSTATS:"
  show_cloudstats

  log "CLOUDTRACE:"
  show_cloudtrace

  log "CLOUDTRACE STATS:"
  show_cloudtrace_stats

  log "===== Ending SupportView for RightScale Audit Log ====="
end

rightscale_marker :end

