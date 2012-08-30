################################################################################
# configure_log_rotation.rb
################################################################################
# Chef definition, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Configure log rotation settings
################################################################################

define :configure_log_rotation do
  log "Log rotation: Starting"
  if node[:cloudoptimizer_configuration][:logs][:log_rotation][:compress] == 'true'
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:compress] = "compress"
  else
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:compress] = ""
  end
  if node[:cloudoptimizer_configuration][:logs][:log_rotation][:date_stamp] == 'true'
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:date_stamp] = "dateext"
  else
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:compress] = ""
  end
  if node[:cloudoptimizer_configuration][:logs][:log_rotation][:mail_logs] != 'none'
    mail_address = node[:cloudoptimizer_configuration][:logs][:log_rotation][:mail_logs]
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:mail_logs] = "mail #{mail_address}"
  else
    node[:cloudoptimizer_configuration][:logs][:log_rotation][:mail_logs] = ""
  end
  log "Log rotation: Ending"
end