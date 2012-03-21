maintainer       "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license          "All rights reserved"
description      "Installs/Configures test"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe		"cloudoptimizer::installcloudoptimizer", "Main installer for cloudoptimizer package"

attribute "cloudoptimizer/stored/cloudoptimizer",
  :display_name => "Stored CloudOptimizer configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :required => "optional", 
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/stored/vtun",
  :display_name => "Stored vtun configuration",
  :description => "URL to a vtund.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/home_directory",
  :display_name => "Home directory",
  :description => "CloudOptimizer home directory - contains byte cache",
  :required => "optional",
  :default => "/home/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/default_cache_size",
  :display_name => "Byte cache size",
  :description => "CloudOptimizer byte cache size in megabytes",
  :required => "optional",
  :default => "8000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/socket_location",
  :display_name => "Socket location",
  :description => "Location of the CloudOptimizer socket file",
  :required => "optional",
  :default => "/var/run/cloudoptimizer/cloudoptimizer_socket",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/bitmap_size",
  :display_name => "Bitmap size",
  :description => "CloudOptimizer cache memory map size",
  :required => "optional",
  :default => "512",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/db_memory_size",
  :display_name => "Index size",
  :description => "CloudOptimizer cache memory index size",
  :required => "optional",
  :default => "540",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/log_directory",
  :display_name => "Log directory",
  :description => "Location of CloudOptimizer log files",
  :required => "optional",
  :default => "/var/log/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/log_key",
  :display_name => "Log key",
  :description => "Key for CloudOptimizer shared memory",
  :required => "optional",
  :default => "12345678",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/compression_engine",
  :display_name => "Compression engine",
  :description => "CloudOptimizer compression engine",
  :required => "optional",
  :default => "snappy",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/default_compression_level",
  :display_name => "Compression level",
  :description => "CloudOptimizer compression level",
  :required => "optional",
  :default => "0",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/optimistic_deduplication",
  :display_name => "First pass optimization",
  :description => "CloudOptimizer first pass optimization",
  :required => "optional",
  :default => "false",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/cache_promotion",
  :display_name => "Cache promotion",
  :description => "CloudOptimizer cache promotion",
  :required => "optional",
  :default => "true",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/compress_cache",
  :display_name => "Cache compression",
  :description => "CloudOptimizer byte cache compression",
  :required => "optional",
  :default => "true",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/thread_count",
  :display_name => "Thread count",
  :description => "CloudOptimizer thread count",
  :required => "optional",
  :default => "1",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/intelligent_mesh",
  :display_name => "Intelligent mesh",
  :description => "CloudOptimizer intelligent mesh",
  :required => "optional",
  :default => "false",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/local_proxy_address",
  :display_name => "Local proxy address",
  :description => "CloudOptimizer local proxy address",
  :required => "optional",
  :default => "0.0.0.0:9000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_proxy_port",
  :display_name => "Peer proxy port",
  :description => "CloudOptimizer peer proxy port",
  :required => "optional",
  :default => "9001",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_encryption",
  :display_name => "Peer encryption",
  :description => "CloudOptimizer peer encryption",
  :required => "optional",
  :default => "self_signed",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_key",
  :display_name => "SSL key",
  :description => "CloudOptimizer SSL key file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_cert",
  :display_name => "SSL certificate",
  :description => "CloudOptimizer SSL certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/ssl_ca",
  :display_name => "SSL CA certificate",
  :description => "CloudOptimizer SSL CA certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]

attribute "cloudoptimizer/configuration/peer_statement",
  :display_name => "Peer statement",
  :description => "CloudOptimizer peer statement for endpoint mode",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer" ]
