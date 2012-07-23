################################################################################
# mediawiki_extension_collection.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the Collection MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "Collection" do
     repo "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git"
end

rightscale_marker :end