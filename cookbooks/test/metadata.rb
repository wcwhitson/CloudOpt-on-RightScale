maintainer       "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license          "All rights reserved"
description      "Installs/Configures test"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe		"test::helloworld", "Hello World program"
recipe		"test::installcloudoptimizer", "Main installer for cloudoptimizer package"

attribute "test/configuration/stored/cloudoptimizer.conf",
  :display_name => "Stored configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :type => "string",
  :required => "optional", 
  :recipes => [ "test::installcloudoptimizer" ]
