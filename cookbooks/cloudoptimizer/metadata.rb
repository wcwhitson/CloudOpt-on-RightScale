maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes CloudOptimizer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.71"

supports "centos", "~> 5.5"
supports "centos", "~> 5.6"
supports "centos", "~> 5.7"
supports "centos", "~> 5.8"
supports "centos", "~> 6.0"
supports "centos", "~> 6.1"
supports "centos", "~> 6.2"
supports "centos", "~> 6.3"
supports "ubuntu", "~> 10.04"
supports "ubuntu", "~> 11.04"
supports "ubuntu", "~> 11.10"
supports "ubuntu", "~> 12.04"
supports "ubuntu", "~> 12.10"
supports "ubuntu", "~> 13.04"

depends "block_device"
depends "sys_firewall"
depends "rightscale"

recipe "cloudoptimizer::cloudoptimizer_add_mysql_master_as_peer", "Add a MySQL master peer statement to a slave CloudOptimizer"
recipe "cloudoptimizer::cloudoptimizer_clear_cache", "Clear the CloudOptimizer byte cache"
recipe "cloudoptimizer::cloudoptimizer_cloudstats", "Show cloudstats output in the audit log"
recipe "cloudoptimizer::cloudoptimizer_cloudtrace_stats", "Show cloudtrace stats output in the audit log"
recipe "cloudoptimizer::cloudoptimizer_configure", "Post-installation configuration (everything but peers and endpoints)"
recipe "cloudoptimizer::cloudoptimizer_dump_core", "Make CloudOptimizer dump core and restart.  Only use at the direction of CloudOpt Support"
recipe "cloudoptimizer::cloudoptimizer_install", "Main installer for cloudoptimizer package"
recipe "cloudoptimizer::cloudoptimizer_manage_peers_and_endpoints", "Configure peers and endpoints"
recipe "cloudoptimizer::cloudoptimizer_reload", "Reload the CloudOptimizer configuration"
recipe "cloudoptimizer::cloudoptimizer_remove", "Remove CloudOptimizer packages"
recipe "cloudoptimizer::cloudoptimizer_restart", "Restart the CloudOptimizer service"
recipe "cloudoptimizer::cloudoptimizer_show_configuration", "Display the CloudOptimizer configuration in the Audit Log"
recipe "cloudoptimizer::cloudoptimizer_show_status", "Display the CloudOptimizer operational status in the Audit Log"
recipe "cloudoptimizer::cloudoptimizer_show_version", "Display the CloudOptimizer version in the Audit Log"
recipe "cloudoptimizer::cloudoptimizer_start", "Start the CloudOptimizer service"
recipe "cloudoptimizer::cloudoptimizer_stop", "Stop the CloudOptimizer service"
recipe "cloudoptimizer::cloudoptimizer_supportview", "Create/upload a cloudoptimizer_supportview diagnostics archive"
recipe "cloudoptimizer::cloudoptimizer_upgrade", "Upgrade CloudOptimizer without changing its configuration"

attribute "cloudoptimizer/stored_configuration/cloudoptimizer",
  :display_name => "Stored CloudOptimizer configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/file_locations/home_directory",
  :display_name => "Home directory",
  :description => "CloudOptimizer home directory - contains byte cache",
  :required => "optional",
  :default => "/home/cloudoptimizer",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure",  "cloudoptimizer::cloudoptimizer_supportview", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/default_cache_size",
  :display_name => "Byte cache size",
  :description => "CloudOptimizer byte cache size in megabytes",
  :required => "optional",
  :default => "8000",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/file_locations/socket_location",
  :display_name => "Socket location",
  :description => "Location of the CloudOptimizer socket file",
  :required => "optional",
  :default => "/var/run/cloudoptimizer/cloudoptimizer_socket",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/logs/log_directory",
  :display_name => "Log directory",
  :description => "Location of CloudOptimizer log files",
  :required => "optional",
  :default => "/var/log/cloudoptimizer",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/logs/log_key",
  :display_name => "Log key",
  :description => "Key for CloudOptimizer shared memory",
  :required => "optional",
  :default => "12345678",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/compression/compression_engine",
  :display_name => "Compression engine",
  :description => "CloudOptimizer compression engine",
  :required => "optional",
  :default => "snappy",
  :choice => [ "snappy", "zlib", "null" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/compression/default_compression_level",
  :display_name => "Compression level",
  :description => "CloudOptimizer compression level",
  :required => "optional",
  :default => "0",
  :choice => [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/optimistic_deduplication",
  :display_name => "First pass optimization",
  :description => "CloudOptimizer first pass optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/cache_promotion",
  :display_name => "Cache promotion",
  :description => "CloudOptimizer cache promotion",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/shared_cache",
  :display_name => "Shared cache",
  :description => "If true, all clients that connect to CloudOptimizer will use the same cache",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/compress_cache",
  :display_name => "Cache compression",
  :description => "CloudOptimizer byte cache compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/thread_count",
  :display_name => "Thread count",
  :description => "CloudOptimizer thread count",
  :required => "optional",
  :default => "1",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/intelligent_mesh",
  :display_name => "Intelligent mesh",
  :description => "CloudOptimizer intelligent mesh",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/local_proxy_address",
  :display_name => "Local proxy address",
  :description => "CloudOptimizer local proxy address",
  :required => "optional",
  :default => "0.0.0.0",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/local_proxy_port",
  :display_name => "Local proxy port",
  :description => "CloudOptimizer local proxy port",
  :required => "optional",
  :default => "9000",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/peer_proxy_port",
  :display_name => "Peer proxy port",
  :description => "CloudOptimizer peer proxy port",
  :required => "optional",
  :default => "9001",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/peer_encryption",
  :display_name => "Peer encryption",
  :description => "CloudOptimizer peer encryption",
  :required => "optional",
  :default => "self_signed",
  :choice => [ "self_signed", "ca_signed", "off" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_key",
  :display_name => "SSL key",
  :description => "CloudOptimizer SSL key file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_cert",
  :display_name => "SSL certificate",
  :description => "CloudOptimizer SSL certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_ca",
  :display_name => "SSL CA certificate",
  :description => "CloudOptimizer SSL CA certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/peers/peer_operation",
  :display_name => "Peer operation",
  :description => "Set peer_to_modify and/or endpoint_to_modify and then select an operation",
  :required => "optional",
  :default => "No change",
  :choice => [ "No change", "Add peer without endpoint", "Add peer with endpoint", "Add endpoint to peer", "Delete endpoint from peer", "Delete peer", "Clear all peers" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_manage_peers_and_endpoints" ]

attribute "cloudoptimizer_configuration/peers/peer_to_modify",
  :display_name => "Peer to modify",
  :description => "Set peer_to_modify and peer_operation to perform an action on a peer",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::cloudoptimizer_manage_peers_and_endpoints" ]
    
attribute "cloudoptimizer_configuration/peers/endpoint_to_modify",
  :display_name => "Endpoint to modify",
  :description => "Set endpoint_to_modify, peer_to_modify, and peer_operation to perform an action on a peer",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::cloudoptimizer_manage_peers_and_endpoints" ]  

attribute "cloudoptimizer/version",
  :display_name => "Version lock",
  :description => "Lock this server to a particular CloudOptimizer version",
  :required => "optional",
  :default => "latest",
  :choice => [ "latest", "1.3.0", "1.2.1" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/http_proxy",
  :display_name => "HTTP proxy (squid)",
  :description => "CloudOptimizer acts as an HTTP proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/http_proxy_port",
  :display_name => "HTTP proxy port",
  :description => "CloudOptimizer HTTP proxy listening port",
  :required => "optional",
  :default => "9003",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]
    
attribute "cloudoptimizer_configuration/socks/socks_proxy",
  :display_name => "SOCKS proxy",
  :description => "CloudOptimizer acts as a SOCKS4 proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/socks/socks_proxy_port",
  :display_name => "SOCKS proxy port",
  :description => "CloudOptimizer SOCKS4 proxy listening port",
  :required => "optional",
  :default => "9002",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/socks/socks_username",
  :display_name => "SOCKS proxy user name",
  :description => "CloudOptimizer SOCKS4 proxy user name",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/source_transparency",
  :display_name => "Source transparency",
  :description => "CloudOptimizer acts as a transparent proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/transp_intip",
  :display_name => "Internal IP address",
  :description => "Internal/private IP address to use with source transparency",
  :required => "optional",
  :default => "First private IP address",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/transp_extip",
  :display_name => "External IP address",
  :description => "External/public IP address to use with source transparency",
  :required => "optional",
  :default => "First public IP address",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/additional/cloudoptimizers3",
  :display_name => "CloudController",
  :description => "Install the CloudController package for Amazon S3",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/additional/cloudoptimizerwebui",
  :display_name => "CloudOptimizer Web Interface",
  :description => "Install a web interface",
  :required => "optional",
  :default => "Install",
  :choice => [ "Install", "Do not install" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/beta",
  :display_name => "Install Beta Versions",
  :description => "Install beta versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/remove",
  :display_name => "Remove CloudOptimizer Packages",
  :description => "Remove all or part of the CloudOptimizer configuration",
  :required => "optional",
  :default => "Do not remove",
  :choice => [ "Do not remove", "All Packages and Files", "All Packages (Retain Files)", "CloudController", "Web GUI" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_remove", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/special",
  :display_name => "Install Special Versions",
  :description => "Install special versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/supportview",
  :display_name => "SupportView",
  :description => "Create a support diagnostics file and, optionally, upload to CloudOpt",
  :required => "optional",
  :default => "Do not run SupportView",
  :choice => [ "Do not run SupportView", "Upload a full archive", "Upload a light archive", "Create a local archive", "Report to Audit Log only" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/user_feedback",
  :display_name => "Product Feedback",
  :description => "Automatically provide CloudOpt with information about how you use CloudOptimizer",
  :required => "optional",
  :default => "Basic feedback",
  :choice => [ "Basic feedback", "Detailed feedback", "No feedback" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/cifs/optimize_cifs",
  :display_name => "CIFS optimization",
  :description => "Enable or disable CIFS optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]
  
attribute "cloudoptimizer_configuration/encryption/ssl_termination",
  :display_name => "SSL termination",
  :description => "CloudOptimizer will terminate HTTPS connections to allow optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/upstream_verification",
  :display_name => "Upstream certificate verification",
  :description => "CloudOptimizer will verify a valid server certificate when SSL termination is enabled",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install", "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/web_interface/webui_passwd",
  :display_name => "Web interface password",
  :description => "Password for the CloudOptimizer web interface",
  :required => "optional",
  :default => "disabled",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_mysql/endpoints/master_cloudoptimizer_address",
  :display_name => "MySQL Master CloudOptimizer IP Address or DNS Name",
  :description => "In a CloudOptimizer MySQL Edition deployment, enter the public IP address (or associated DNS name) of the CloudOptimizer that the master database server uses for outbound traffic.  When CloudOptimizer is installed on the same instance as the master database server, this is the public IP address (or associated DNS name) of the instance.",
  :required => "optional",
  :default => "ignore",
  :recipes => [ "cloudoptimizer::cloudoptimizer_add_mysql_master_as_peer" ]
    
attribute "cloudoptimizer_mysql/endpoints/master_db_address",
  :display_name => "Master MySQL Database IP Address or DNS Name",
  :description => "In a CloudOptimizer MySQL Edition deployment, enter the private IP address (or associated DNS name) of the MySQL master instance.",
  :required => "optional",
  :default => "ignore",
  :recipes => [ "cloudoptimizer::cloudoptimizer_add_mysql_master_as_peer" ]
    
attribute "cloudoptimizer_configuration/logs/log_rotation/compress",
  :display_name => "Compress rotated logs",
  :description => "When CloudOptimizer logs are rotated, compress the old log",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", ]
    
attribute "cloudoptimizer_configuration/logs/log_rotation/period",
  :display_name => "Log rotation period",
  :description => "How often CloudOptimizer should rotate its log files",
  :required => "optional",
  :default => "daily",
  :choice => [ "daily", "weekly", "monthly", "yearly" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", ]
    
attribute "cloudoptimizer_configuration/logs/log_rotation/save_days",
  :display_name => "Number of saved logs",
  :description => "How many archived logs CloudOptimizer should save",
  :required => "optional",
  :default => "10",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", ]
    
attribute "cloudoptimizer_configuration/logs/log_rotation/date_stamp",
  :display_name => "Log date stamp",
  :description => "When CloudOptimizer logs are rotated, a date stamp is added to the name",
  :required => "optional",
  :default => "false",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", ]
    
attribute "cloudoptimizer_configuration/logs/log_rotation/mail_logs",
  :display_name => "Log mailing address",
  :description => "If you enter an email address, CloudOptimizer will mail archived logs to that address before they are deleted",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::cloudoptimizer_install",  "cloudoptimizer::cloudoptimizer_configure", ]