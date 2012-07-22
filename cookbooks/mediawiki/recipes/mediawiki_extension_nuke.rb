################################################################################
# mediawiki_extension_nuke.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the Nuke MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "Nuke" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/Nuke.git"
end

rightscale_marker :end
