################################################################################
# mediawiki_extension_googleanalytics.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 CloudOpt, Inc.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the googleAnalytics MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "googleAnalytics" do
     repo "http://svn.wikimedia.org/svnroot/mediawiki/trunk/extensions/googleAnalytics/"
end

rightscale_marker :end
