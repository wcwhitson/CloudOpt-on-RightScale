################################################################################
# cloudoptimizer_configure.rb
################################################################################
# Chef recipe, part of cloudoptimizer cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# General purpose reconfiguration of CloudOptimizer.  This recipe is only used
# after initial configuration.  Primary configuration takes place in the
# cloudoptimizer_install recipe.
################################################################################

rs_utils_marker :begin

# Alternate home and log directories
# Unlike in the install script, here we do not delete the previous directories
# under the assumption that they actually contain user data.

# Create alternate home directory

create_home_directory

# Create alternate log directory

create_log_directory

# Install additional packages

# Install the CloudController package if selected
install_cloudcontroller_package

# Install the cloudoptimizer-tools package if selected
install_cloudoptimizer_tools_package

# Install the CloudOptimizer stats GUI
install_cloudoptimizer_webui_package

# Here we set the public and private addresses to use when the transparent proxy is enabled.  By default, we use the
# first returned IP address for each, as there will generally be only one.  If the user has specified an address, we
# use that instead.

configure_transparent_proxy

# We use chef templates to build the configuration file.  When new options are added to the configuration file, we must
# add a new template to match.  When multiple versions of the configuration file are supported at the same time, we must
# determine the CloudOptimizer version that we are installing and use the appropriate template for that version.

write_configuration_template

# Install stored configurations

# Here we give the user the option to retrieve stored configuration files for a truly persistent CloudOptimizer
# installation that can be stopped and started without requiring reconfiguration.  Files must be provided on an
# unprotected HTTP server.

# Stored configuration files take precedence over all other configuration.  Thus, if the user sets individual
# configuration options, but also specifies a stored config file, the individual configuration options will be
# ignored.

# Stored CloudOptimizer configuration file
get_configuration_stored


# Reload the CloudOptimizer configuration.  This will put any changes into the running config and will 
# be harmless otherwise.

log "Restarting CloudOptimizer to pick up configuration changes."
restart_cloudoptimizer

rs_utils_marker :end
