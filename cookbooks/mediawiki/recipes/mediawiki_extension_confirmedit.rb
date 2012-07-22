################################################################################
# mediawiki_extension_confirmedit.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ConfirmEdit MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ConfirmEdit" do
     repo "https://gerrit.wikimedia.org/r/gitweb?p=mediawiki/extensions/ConfirmEdit.git"
end

rightscale_marker :end