################################################################################
# fix_syslogng.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Older versions of the package post-installation script expect a static name
# for the syslog-ng source.  If the name wasn't what we expected, syslog-ng
# would fail, causing installtion to fail.  So, this is a bit of a hack to
# install a fixed syslog-ng config stanza before the post-install script runs.
################################################################################

define :fix_syslogng do
  log "Fix syslog: Starting"
  bash "fix_syslog" do
    user "root"
    cwd "/tmp"
    code <<-EOH
    CONF=/etc/syslog-ng/syslog-ng.conf
    if [ -f "$CONF" ]
      source=`grep -m1 ^source ${CONF} |cut -d' ' -f2`
      echo "destination d_cloudoptimizer { file(\"/var/log/cloudoptimizer/cloudoptimizer.log\" create_dirs(yes)); };" >>$CONF
      echo "destination d_cloudcopy { file(\"/var/log/cloudoptimizer/cloudcopy.log\" create_dirs(yes)); };" >>$CONF
      echo "destination d_cloudlicense { file(\"/var/log/cloudoptimizer/cloudlicense.log\" create_dirs(yes)); };" >>$CONF
      echo "filter f_cloudoptimizer { level(info..emerg) and program(\"cloudoptimizer\"); };" >>$CONF
      echo "filter f_cloudcopy { level(info..emerg) and program(\"cloudcopy\"); };" >>$CONF
      echo "filter f_cloudlicense { level(info..emerg) and program(\"cloudlicense\"); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudoptimizer); destination(d_cloudoptimizer); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudcopy); destination(d_cloudcopy); };" >>$CONF
      echo "log { source(${source}); filter(f_cloudlicense); destination(d_cloudlicense); };" >>$CONF
    fi
    EOH
  end
    log "Fix syslog: Ending"
end