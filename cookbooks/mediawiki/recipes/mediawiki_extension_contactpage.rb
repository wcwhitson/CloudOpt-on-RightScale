################################################################################
# mediawiki_extension_contactpage.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ContactPage MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ContactPage" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/ContactPage.git"
end

rightscale_marker :end