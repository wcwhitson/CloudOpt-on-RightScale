maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes CloudOptimizer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.22"
recipe "cloudoptimizer::installcloudoptimizer", "Main installer for cloudoptimizer package"
recipe "cloudoptimizer::configurecloudoptimizer", "Post-installation configuration"
recipe "cloudoptimizer::showcloudoptimizer", "Display the CloudOptimizer configuration in the Audit Log"
recipe "cloudoptimizer::clearcache", "Clear the CloudOptimizer byte cache"
recipe "cloudoptimizer::reloadcloudoptimizer", "Reload the CloudOptimizer configuration"
recipe "cloudoptimizer::restartcloudoptimizer", "Restart the CloudOptimizer service"
recipe "cloudoptimizer::removecloudoptimizer", "Remove CloudOptimizer packages"
recipe "cloudoptimizer::supportview", "Create/upload a SupportView diagnostics archive"

attribute "cloudoptimizer/stored/cloudoptimizer",
  :display_name => "Stored CloudOptimizer configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/stored/vtun",
  :display_name => "Stored vtun configuration",
  :description => "URL to a vtund.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/home_directory",
  :display_name => "Home directory",
  :description => "CloudOptimizer home directory - contains byte cache",
  :required => "optional",
  :default => "/home/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/default_cache_size",
  :display_name => "Byte cache size",
  :description => "CloudOptimizer byte cache size in megabytes",
  :required => "optional",
  :default => "8000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/socket_location",
  :display_name => "Socket location",
  :description => "Location of the CloudOptimizer socket file",
  :required => "optional",
  :default => "/var/run/cloudoptimizer/cloudoptimizer_socket",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/bitmap_size",
  :display_name => "Bitmap size",
  :description => "CloudOptimizer cache memory map size",
  :required => "optional",
  :default => "512",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/db_memory_size",
  :display_name => "Index size",
  :description => "CloudOptimizer cache memory index size",
  :required => "optional",
  :default => "384",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/log_directory",
  :display_name => "Log directory",
  :description => "Location of CloudOptimizer log files",
  :required => "optional",
  :default => "/var/log/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/log_key",
  :display_name => "Log key",
  :description => "Key for CloudOptimizer shared memory",
  :required => "optional",
  :default => "12345678",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/compression_engine",
  :display_name => "Compression engine",
  :description => "CloudOptimizer compression engine",
  :required => "optional",
  :default => "snappy",
  :choice => [ "snappy", "zlib", "null" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/default_compression_level",
  :display_name => "Compression level",
  :description => "CloudOptimizer compression level",
  :required => "optional",
  :default => "0",
  :choice => [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/optimistic_deduplication",
  :display_name => "First pass optimization",
  :description => "CloudOptimizer first pass optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/cache_promotion",
  :display_name => "Cache promotion",
  :description => "CloudOptimizer cache promotion",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/compress_cache",
  :display_name => "Cache compression",
  :description => "CloudOptimizer byte cache compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/thread_count",
  :display_name => "Thread count",
  :description => "CloudOptimizer thread count",
  :required => "optional",
  :default => "1",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/intelligent_mesh",
  :display_name => "Intelligent mesh",
  :description => "CloudOptimizer intelligent mesh",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/local_proxy_address",
  :display_name => "Local proxy address",
  :description => "CloudOptimizer local proxy address",
  :required => "optional",
  :default => "0.0.0.0:9000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_proxy_port",
  :display_name => "Peer proxy port",
  :description => "CloudOptimizer peer proxy port",
  :required => "optional",
  :default => "9001",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_encryption",
  :display_name => "Peer encryption",
  :description => "CloudOptimizer peer encryption",
  :required => "optional",
  :default => "self_signed",
  :choice => [ "self_signed", "ca_signed", "off" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_key",
  :display_name => "SSL key",
  :description => "CloudOptimizer SSL key file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_cert",
  :display_name => "SSL certificate",
  :description => "CloudOptimizer SSL certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_ca",
  :display_name => "SSL CA certificate",
  :description => "CloudOptimizer SSL CA certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_statement",
  :display_name => "Peer statement",
  :description => "CloudOptimizer peer statement for Client edition (for Cloud edition, use a stored configuration)",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/version",
  :display_name => "Version lock",
  :description => "Lock this server to a particular CloudOptimizer version",
  :required => "optional",
  :default => "latest",
  :choice => [ "latest", "0.9.4", "0.9.3.2", "0.9.3.1", "0.9.3", "0.9.2.3" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/packages/optional/vtun",
  :display_name => "VTun",
  :description => "Install the vtun package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/packages/optional/frox",
  :display_name => "Frox",
  :description => "Install the frox package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/packages/optional/mysql-proxy",
  :display_name => "MySQL Proxy",
  :description => "Install the mysql-proxy package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/socks_proxy",
  :display_name => "SOCKS proxy",
  :description => "CloudOptimizer acts as a SOCKS4 proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/socks_proxy_port",
  :display_name => "SOCKS proxy port",
  :description => "CloudOptimizer SOCKS4 proxy listening port",
  :required => "optional",
  :default => "9002",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/socks_username",
  :display_name => "SOCKS proxy user name",
  :description => "CloudOptimizer SOCKS4 proxy user name",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/source_transparency",
  :display_name => "Source transparency",
  :description => "CloudOptimizer acts as a transparent proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/transp_intip",
  :display_name => "Internal IP address",
  :description => "Internal/private IP address to use with source transparency",
  :required => "optional",
  :default => "First private IP address",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/configuration/transp_extip",
  :display_name => "External IP address",
  :description => "External/public IP address to use with source transparency",
  :required => "optional",
  :default => "First public IP address",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/packages/supplemental/cloudoptimizers3",
  :display_name => "CloudController",
  :description => "Install the CloudController package for Amazon S3",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimize", "cloudoptimizer::configurecloudoptimizerr" ]

attribute "cloudoptimizer/packages/supplemental/cloudoptimizertools",
  :display_name => "CloudOptimizer Tools",
  :description => "Install additional scripts and tools for the command line",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/packages/supplemental/cloudoptimizerstat",
  :display_name => "CloudOptimizer Web Statistics",
  :description => "Install a web statistics interface",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer" ]

attribute "cloudoptimizer/packages/beta",
  :display_name => "Install Beta Versions",
  :description => "Install beta versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", ]

attribute "cloudoptimizer/packages/remove",
  :display_name => "Remove CloudOptimizer Packages",
  :description => "Remove all or part of the CloudOptimizer configuration",
  :required => "optional",
  :default => "Do not remove",
  :choice => [ "Do not remove", "All Packages and Files", "All Packages (Retain Files)", "CloudController", "Web GUI" ],
  :recipes => [ "cloudoptimizer::removecloudoptimizer", ]

attribute "cloudoptimizer/packages/special",
  :display_name => "Install Special Versions",
  :description => "Install special versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", ]

attribute "cloudoptimizer/credentials/aws/accesskey",
  :display_name => "AWS Access Key",
  :description => "Install your AWS access key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", ]

attribute "cloudoptimizer/credentials/aws/secretkey",
  :display_name => "AWS Secret Key",
  :description => "Install your AWS secret key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", ]
