################################################################################
# mediawiki_extension_emailcapture.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the EmailCapture MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "EmailCapture" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/EmailCapture.git"
end

rightscale_marker :end
