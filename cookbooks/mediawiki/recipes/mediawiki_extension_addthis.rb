################################################################################
# mediawiki_extension_addthis.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the AddThis MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "AddThis" do
     repo "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/AddThis.git"
end

rightscale_marker :end
