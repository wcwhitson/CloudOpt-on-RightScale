maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes MediaWiki"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.07"

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
recipe "mediawiki::mediawiki_update_settings", "Update MediaWiki settings after first time configuration"

attribute "mediawiki/installation_directory",
  :display_name => "Installation directory",
  :description => "Path to directory where MediaWiki will be installed",
  :required => "optional",
  :default => "/var/www/wiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/output_compression",
  :display_name => "Output compression",
  :description => "Enable or disabled output compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
        
attribute "mediawiki/site_name",
  :display_name => "Site name",
  :description => "Name of the MediaWiki installation",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/dns_name",
  :display_name => "DNS name",
  :description => "DNS name of the MediaWiki site",
  :required => "optional",
  :default => "Public IP",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/logo_path",
  :display_name => "Logo path",
  :description => "Path to your MediaWiki site logo",
  :required => "optional",
  :default => '$wgStylePath/common/images/custom.png',
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/enable_email",
  :display_name => "Site email",
  :description => "Enable or disable site email",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/enable_user_email",
  :display_name => "User email",
  :description => "Enable or disabled user email",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/admin_email",
  :display_name => "Administrator e-mail address",
  :description => "E-mail address of the MediaWiki site administrator",
  :required => "optional",
  :default => "apache@Public IP",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_server_address",
  :display_name => "Database server address",
  :description => "MediaWiki database server name or IP address",
  :required => "optional",
  :default => "localhost",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/db_type",
  :display_name => "Database type",
  :description => "MediaWiki database type",
  :required => "optional",
  :default => "mysql",
  :choice => [ "mysql", "postgresql", "sqlite" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/db_name",
  :display_name => "Database name",
  :description => "MediaWiki database name",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]

attribute "mediawiki/db_root_account",
  :display_name => "Database root account",
  :description => "Root account name for the MediaWiki database",
  :required => "optional",
  :default => "root",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_root_password",
  :display_name => "Database root password",
  :description => "Password for the MediaWiki database root account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/db_user_account",
  :display_name => "Database non-root account",
  :description => "Database non-root account used for normal operations",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_user_password",
  :display_name => "Database non-root account password",
  :description => "Password for database non-root account used for normal operations",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/mediawiki_admin_account",
  :display_name => "MediaWiki admin account",
  :description => "Admin account name for MediaWiki",
  :required => "optional",
  :default => "WikiSysop",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/mediawiki_admin_password",
  :display_name => "Mediawiki admin password",
  :description => "Password for the MediaWiki admin account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/file_uploads",
  :display_name => "File uploads",
  :description => "To enable image uploads, make sure the 'images' directory is writable, then set this to true:",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/image_magick",
  :display_name => "Image Magick",
  :description => "Enable or disable use of Image Magick to create thumbnails",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/image_magick_path",
  :display_name => "Image Magick path",
  :description => "Path to the Image Magick convert executable",
  :required => "optional",
  :default => "/usr/bin/convert",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/instant_commons",
  :display_name => "Instant commons",
  :description => "InstantCommons allows wiki to use images from http://commons.wikimedia.org",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_page",
  :display_name => "Rights page",
  :description => "Set to the title of a wiki page that describes your license/copyright",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_url",
  :display_name => "Rights URL",
  :description => "URL of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_text",
  :display_name => "Rights text",
  :description => "MediaWiki rights text",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_icon",
  :display_name => "Rights icon",
  :description => "Path to the MediaWiki rights icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/favicon",
  :display_name => "Favorites icon",
  :description => "Path to the favorites icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/download_logo_url",
  :display_name => "Custom logo",
  :description => "URL from which to download your custom MediaWiki logo",
  :required => "optional",
  :default => "kb.cloudopt.com/coandrs.png",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/download_favicon",
  :display_name => "Download favorites icon",
  :description => "URL from which to download your custom favorites icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/download_localsettings",
  :display_name => "Download LocalSettings.php",
  :description => "If you intend to install an existing MediaWiki database, supply a URL to download the LocalSettings.php that was generated with that database.  It will be used to populate the new LocalSettings.php.",
  :required => "optional",
  :default => "ignore",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/style_path",
  :display_name => "Style path",
  :description => "The relative URL path to the skins directory",
  :required => "optional",
  :default => "$wgScriptPath/skins",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/diff3_path",
  :display_name => "diff3 path",
  :description => "Path to the GNU diff3 utility. Used for conflict resolution.",
  :required => "optional",
  :default => "/usr/bin/diff3",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/max_query_length",
  :display_name => "Max query length",
  :description => "Query string length limit for ResourceLoader. You should only set this if your web server has a query string length limit (then set it to that limit), or if you have suhosin.get.max_value_length set in php.ini (then set it to that value)",
  :required => "optional",
  :default => "-1",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/script_path",
  :display_name => "Script path",
  :description => "The URL base path to the directory containing the wiki defaults for all runtime URL paths are based off of this.  This must be a full URL including protocol (e.g. http://mywikiserver.com).",
  :required => "optional",
  :default => "/wiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/default_skin",
  :display_name => "Default skin",
  :description => "Default skin: you can change the default skin. Use the internal symbolic names, ie 'standard', 'nostalgia', 'cologneblue', 'monobook', 'vector'",
  :required => "optional",
  :default => "vector",
  :choice => [ "vector", "monobook", "cologneblue", "nostalgia", "standard" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/mw_version",
  :display_name => "MediaWiki version",
  :description => "Select the version of MediaWiki that you want to install",
  :required => "optional",
  :default => "1.19.1",
  :choice => [ "1.19.1", "1.18.4" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]