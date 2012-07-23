################################################################################
# mediawiki_extension_dynamicpagelist2.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the DynamicPageList (third party) MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "DynamicPageList" do
     repo "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/DynamicPageList.git"
end

rightscale_marker :end
