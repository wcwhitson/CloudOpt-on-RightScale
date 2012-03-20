maintainer       "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license          "All rights reserved"
description      "Installs/Configures test"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe		"test::helloworld", "Hello World program"
recipe		"test::installcloudoptimizer", "Main installer for cloudoptimizer package"

attribute "test/configuration/stored/cloudoptimizer",
  :display_name => "Stored CloudOptimizer configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :required => "optional", 
  :default => "none",
  :recipes => [ "test::installcloudoptimizer" ]

attribute "test/configuration/stored/vtun",
  :display_name => "Stored vtun configuration",
  :description => "URL to a vtund.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "test::installcloudoptimizer" ]
