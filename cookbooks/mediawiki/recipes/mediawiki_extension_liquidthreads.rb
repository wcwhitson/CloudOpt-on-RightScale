################################################################################
# mediawiki_extension_liquidthreads.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the LiquidThreads MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "LiquidThreads" do
     repo "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LiquidThreads.git"
end

rightscale_marker :end
