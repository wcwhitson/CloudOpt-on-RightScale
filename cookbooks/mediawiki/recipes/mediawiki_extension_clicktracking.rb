################################################################################
# mediawiki_extension_clicktracking.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ClickTracking MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ClickTracking" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/ClickTracking.git"
end

rightscale_marker :end