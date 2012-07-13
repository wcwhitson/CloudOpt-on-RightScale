################################################################################
# install_python26.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Python 2.6 is required for CloudOptimizer, but not available on Ubuntu 12.04.
# Install it manually if we're running on 12.04.  Install and use gdebi in
# order to manage the rather convoluted dependencies.
#
# This script will become obsolete once support ends for CloudOptimizer versions
# prior to 1.1.6.
################################################################################

define :install_python26 do
  log "Install python: Starting"
  package "gdebi"
  if node[:languages][:ruby][:host_cpu] == 'i686'
    log "Install python: Using the i386 packages."
    remote_file "/var/tmp/python2.6-minimal_2.6.7-4ubuntu1_i386.deb" do
      source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6-minimal_2.6.7-4ubuntu1_i386.deb"
    end
    remote_file "/var/tmp/python2.6_2.6.7-4ubuntu1_i386.deb" do
      source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6_2.6.7-4ubuntu1_i386.deb"
    end
    execute "gdebi" do
      command "gdebi --n /var/tmp/python2.6-minimal_2.6.7-4ubuntu1_i386.deb"
    end
    execute "gdebi" do
      command "gdebi --n /var/tmp/python2.6_2.6.7-4ubuntu1_i386.deb"
    end
  elsif node[:languages][:ruby][:host_cpu] == 'x86_64'
    log "Install python: Using the amd64 packages."
    remote_file "/var/tmp/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb" do
      source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb"
    end
    remote_file "/var/tmp/python2.6_2.6.7-4ubuntu1_amd64.deb" do
      source "http://us.archive.ubuntu.com/ubuntu/pool/main/p/python2.6/python2.6_2.6.7-4ubuntu1_amd64.deb"
    end
    execute "gdebi" do
      command "gdebi --n /var/tmp/python2.6-minimal_2.6.7-4ubuntu1_amd64.deb"
    end
    execute "gdebi" do
      command "gdebi --n /var/tmp/python2.6_2.6.7-4ubuntu1_amd64.deb"
    end
  else
    log "Install python: Couldn't determine architecture.  Not installing."
  end
  log "Install python: Ending"
end