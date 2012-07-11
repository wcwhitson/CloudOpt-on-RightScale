maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes MediaWiki"
version "0.01"
recipe "mediawiki::installmediawiki", "Install and configure MediaWiki"

attribute "mediawiki/cloud_credentials/aws/accesskey",
  :display_name => "AWS Access Key",
  :description => "Install your AWS access key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/cloud_credentials/aws/secretkey",
  :display_name => "AWS Secret Key",
  :description => "Install your AWS secret key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/installation_directory",
  :display_name => "Installation directory",
  :description => "Path to directory where MediaWiki will be installed",
  :required => "optional",
  :default => "/var/www/",
  :recipes => [ "mediawiki::installmediawiki" ]
    
attribute "mediawiki/output_compression",
  :display_name => "Output compression",
  :description => "Enable or disabled output compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "mediawiki::installmediawiki" ]
      
attribute "mediawiki/site_name]",
  :display_name => "Site name",
  :description => "Name of the MediaWiki installation",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/dns_name",
  :display_name => "DNS name",
  :description => "DNS name of the MediaWiki site",
  :required => "optional",
  :default => "Public IP",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/logo_url",
  :display_name => "Logo URL",
  :description => "Path to your MediaWiki site logo",
  :required => "optional",
  :default => '$wgStylePath/common/images/wiki.png',
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/enable_email",
  :display_name => "Site email",
  :description => "Enable or disable site email",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/enable_user_email",
  :display_name => "User email",
  :description => "Enable or disabled user email",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/admin_email",
  :display_name => "Administrator e-mail address",
  :description => "E-mail address of the MediaWiki site administrator",
  :required => "optional",
  :default => "apache@Public IP",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/db_name",
  :display_name => "Database name",
  :description => "MediaWiki database name",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/db_root_account",
  :display_name => "Database root account",
  :description => "Root account name for the MediaWiki database",
  :required => "optional",
  :default => "root",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/db_root_password",
  :display_name => "Database root password",
  :description => "Password for the MediaWiki database root account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/db_prefix",
  :display_name => "Database prefix",
  :description => "MediaWiki database prefix",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/file_uploads",
  :display_name => "File uploads",
  :description => "Enable or disable file uploads",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/image_magick",
  :display_name => "Image Magick",
  :description => "Enable or disable use of Image Magick to create thumbnails",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/image_magick_path",
  :display_name => "Image Magick path",
  :description => "Path to the Image Magick convert executable",
  :required => "optional",
  :default => "/usr/bin/convert",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/instant_commons",
  :display_name => "Instant commons",
  :description => "Enable or disable access to the MediaWiki instant commons",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/rights_page",
  :display_name => "Rights page",
  :description => "Title of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/rights_url",
  :display_name => "Rights URL",
  :description => "URL of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/rights_text",
  :display_name => "Rights text",
  :description => "MediaWiki rights text",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]

attribute "mediawiki/rights_icon",
  :display_name => "Rights icon",
  :description => "Path to the MediaWiki rights icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::installmediawiki" ]