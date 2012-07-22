################################################################################
# mediawiki_extension_gadgets.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the Gadgets MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "Gadgets" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/Gadgets.git"
end

rightscale_marker :end
