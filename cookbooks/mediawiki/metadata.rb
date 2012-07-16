maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes MediaWiki"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.05"

supports "centos", "~> 5.6"
supports "centos", "~> 5.7"
supports "centos", "~> 5.8"
supports "centos", "~> 6.0"
supports "centos", "~> 6.2"
supports "ubuntu", "~> 10.04"
supports "ubuntu", "~> 10.10"
supports "ubuntu", "~> 12.04"

depends "block_device"
depends "sys_firewall"
depends "rightscale"

recipe "mediawiki::mediawiki_install", "Install MediaWiki"
recipe "mediawiki::mediawiki_first_time_config", "Configure MediaWiki with a new database"

attribute "mediawiki/installation_directory",
  :display_name => "Installation directory",
  :description => "Path to directory where MediaWiki will be installed",
  :required => "optional",
  :default => "/var/www/",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/output_compression",
  :display_name => "Output compression",
  :description => "Enable or disabled output compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "mediawiki::mediawiki_install" ]
      
attribute "mediawiki/site_name",
  :display_name => "Site name",
  :description => "Name of the MediaWiki installation",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/dns_name",
  :display_name => "DNS name",
  :description => "DNS name of the MediaWiki site",
  :required => "optional",
  :default => "Public IP",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/logo_url",
  :display_name => "Logo URL",
  :description => "Path to your MediaWiki site logo",
  :required => "optional",
  :default => '$wgStylePath/common/images/wiki.png',
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/enable_email",
  :display_name => "Site email",
  :description => "Enable or disable site email",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/enable_user_email",
  :display_name => "User email",
  :description => "Enable or disabled user email",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/admin_email",
  :display_name => "Administrator e-mail address",
  :description => "E-mail address of the MediaWiki site administrator",
  :required => "optional",
  :default => "apache@Public IP",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/db_server_address",
  :display_name => "Database server address",
  :description => "MediaWiki database server name or IP address",
  :required => "optional",
  :default => "localhost",
  :recipes => [ "mediawiki::mediawiki_install" ]
    
attribute "mediawiki/db_type",
  :display_name => "Database type",
  :description => "MediaWiki database type",
  :required => "optional",
  :default => "mysql",
  :choice => [ "mysql", "postgresql", "sqlite" ],
  :recipes => [ "mediawiki::mediawiki_install" ]
    
attribute "mediawiki/db_name",
  :display_name => "Database name",
  :description => "MediaWiki database name",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/db_root_account",
  :display_name => "Database root account",
  :description => "Root account name for the MediaWiki database",
  :required => "optional",
  :default => "root",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/db_root_password",
  :display_name => "Database root password",
  :description => "Password for the MediaWiki database root account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]
    
attribute "mediawiki/db_user_account",
  :display_name => "Database non-root account",
  :description => "Database non-root account used for normal operations",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/db_user_password",
  :display_name => "Database non-root account password",
  :description => "Password for database non-root account used for normal operations",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]
    
attribute "mediawiki/mediawiki_admin_account",
  :display_name => "MediaWiki admin account",
  :description => "Admin account name for MediaWiki",
  :required => "optional",
  :default => "WikiSysop",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/mediawiki_admin_password",
  :display_name => "Mediawiki admin password",
  :description => "Password for the MediaWiki admin account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/db_prefix",
  :display_name => "Database prefix",
  :description => "MediaWiki database prefix",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/file_uploads",
  :display_name => "File uploads",
  :description => "Enable or disable file uploads",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/image_magick",
  :display_name => "Image Magick",
  :description => "Enable or disable use of Image Magick to create thumbnails",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/image_magick_path",
  :display_name => "Image Magick path",
  :description => "Path to the Image Magick convert executable",
  :required => "optional",
  :default => "/usr/bin/convert",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/instant_commons",
  :display_name => "Instant commons",
  :description => "Enable or disable access to the MediaWiki instant commons",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/rights_page",
  :display_name => "Rights page",
  :description => "Title of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/rights_url",
  :display_name => "Rights URL",
  :description => "URL of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/rights_text",
  :display_name => "Rights text",
  :description => "MediaWiki rights text",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]

attribute "mediawiki/rights_icon",
  :display_name => "Rights icon",
  :description => "Path to the MediaWiki rights icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]
    
attribute "mediawiki/download_logo_url",
  :display_name => "Custom logo",
  :description => "URL to custom MediaWiki logo",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install" ]