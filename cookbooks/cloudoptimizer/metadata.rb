maintainer "CloudOpt, Inc."
maintainer_email "support@cloudopt.com"
license "All rights reserved"
description "Installs/Configures/Removes CloudOptimizer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.46"
recipe "cloudoptimizer::cloudoptcommon", "CloudOpt common functions and methods"
recipe "cloudoptimizer::cloudopt_setup_mail", "Alternate mail setup script"
recipe "cloudoptimizer::installcloudoptimizer", "Main installer for cloudoptimizer package"
recipe "cloudoptimizer::configurecloudoptimizer", "Post-installation configuration"
recipe "cloudoptimizer::showcloudoptimizer", "Display the CloudOptimizer configuration in the Audit Log"
recipe "cloudoptimizer::clearcache", "Clear the CloudOptimizer byte cache"
recipe "cloudoptimizer::reloadcloudoptimizer", "Reload the CloudOptimizer configuration"
recipe "cloudoptimizer::restartcloudoptimizer", "Restart the CloudOptimizer service"
recipe "cloudoptimizer::removecloudoptimizer", "Remove CloudOptimizer packages"
recipe "cloudoptimizer::supportview", "Create/upload a SupportView diagnostics archive"
recipe "cloudoptimizer::addsecuritygroup", "Create a security group for CloudOptimizer ports"
recipe "cloudoptimizer::showversion", "Show the CloudOptimizer version that is running on the server"

attribute "cloudoptimizer/stored_configuration/cloudoptimizer",
  :display_name => "Stored CloudOptimizer configuration",
  :description => "URL to a cloudoptimizer.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/stored_configuration/vtun",
  :display_name => "Stored vtun configuration",
  :description => "URL to a vtund.conf file containing your saved configuration",
  :required => "optional",
  :default => "none",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/file_locations/home_directory",
  :display_name => "Home directory",
  :description => "CloudOptimizer home directory - contains byte cache",
  :required => "optional",
  :default => "/home/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer",  "cloudoptimizer::supportview", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/default_cache_size",
  :display_name => "Byte cache size",
  :description => "CloudOptimizer byte cache size in megabytes",
  :required => "optional",
  :default => "8000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/file_locations/socket_location",
  :display_name => "Socket location",
  :description => "Location of the CloudOptimizer socket file",
  :required => "optional",
  :default => "/var/run/cloudoptimizer/cloudoptimizer_socket",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/bitmap_size",
  :display_name => "Bitmap size",
  :description => "CloudOptimizer cache memory map size",
  :required => "optional",
  :default => "512",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/db_memory_size",
  :display_name => "Index size",
  :description => "CloudOptimizer cache memory index size",
  :required => "optional",
  :default => "384",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/logs/log_directory",
  :display_name => "Log directory",
  :description => "Location of CloudOptimizer log files",
  :required => "optional",
  :default => "/var/log/cloudoptimizer",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/logs/log_key",
  :display_name => "Log key",
  :description => "Key for CloudOptimizer shared memory",
  :required => "optional",
  :default => "12345678",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/compression/compression_engine",
  :display_name => "Compression engine",
  :description => "CloudOptimizer compression engine",
  :required => "optional",
  :default => "snappy",
  :choice => [ "snappy", "zlib", "null" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/compression/default_compression_level",
  :display_name => "Compression level",
  :description => "CloudOptimizer compression level",
  :required => "optional",
  :default => "0",
  :choice => [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/optimistic_deduplication",
  :display_name => "First pass optimization",
  :description => "CloudOptimizer first pass optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/cache_promotion",
  :display_name => "Cache promotion",
  :description => "CloudOptimizer cache promotion",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/byte_cache/compress_cache",
  :display_name => "Cache compression",
  :description => "CloudOptimizer byte cache compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/thread_count",
  :display_name => "Thread count",
  :description => "CloudOptimizer thread count",
  :required => "optional",
  :default => "1",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/intelligent_mesh",
  :display_name => "Intelligent mesh",
  :description => "CloudOptimizer intelligent mesh",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/local_proxy_address",
  :display_name => "Local proxy address",
  :description => "CloudOptimizer local proxy address",
  :required => "optional",
  :default => "0.0.0.0:9000",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/peer_proxy_port",
  :display_name => "Peer proxy port",
  :description => "CloudOptimizer peer proxy port",
  :required => "optional",
  :default => "9001",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/peer_encryption",
  :display_name => "Peer encryption",
  :description => "CloudOptimizer peer encryption",
  :required => "optional",
  :default => "self_signed",
  :choice => [ "self_signed", "ca_signed", "off" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_key",
  :display_name => "SSL key",
  :description => "CloudOptimizer SSL key file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_cert",
  :display_name => "SSL certificate",
  :description => "CloudOptimizer SSL certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/ssl_ca",
  :display_name => "SSL CA certificate",
  :description => "CloudOptimizer SSL CA certificate file",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/peer_statement",
  :display_name => "Peer statement",
  :description => "CloudOptimizer peer statement for Client edition (for Cloud edition, use a stored configuration)",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/version",
  :display_name => "Version lock",
  :description => "Lock this server to a particular CloudOptimizer version",
  :required => "optional",
  :default => "latest",
  :choice => [ "latest", "1.1.5", "0.9.4", "0.9.3.2", "0.9.3.1" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/optional/vtun",
  :display_name => "VTun",
  :description => "Install the vtun package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/optional/frox",
  :display_name => "Frox",
  :description => "Install the frox package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/optional/mysql-proxy",
  :display_name => "MySQL Proxy",
  :description => "Install the mysql-proxy package",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/socks/socks_proxy",
  :display_name => "SOCKS proxy",
  :description => "CloudOptimizer acts as a SOCKS4 proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/socks/socks_proxy_port",
  :display_name => "SOCKS proxy port",
  :description => "CloudOptimizer SOCKS4 proxy listening port",
  :required => "optional",
  :default => "9002",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/socks/socks_username",
  :display_name => "SOCKS proxy user name",
  :description => "CloudOptimizer SOCKS4 proxy user name",
  :required => "optional",
  :default => "",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/source_transparency",
  :display_name => "Source transparency",
  :description => "CloudOptimizer acts as a transparent proxy",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/transp_intip",
  :display_name => "Internal IP address",
  :description => "Internal/private IP address to use with source transparency",
  :required => "optional",
  :default => "First private IP address",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/transparency/transp_extip",
  :display_name => "External IP address",
  :description => "External/public IP address to use with source transparency",
  :required => "optional",
  :default => "First public IP address",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/additional/cloudoptimizers3",
  :display_name => "CloudController",
  :description => "Install the CloudController package for Amazon S3",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/additional/cloudoptimizertools",
  :display_name => "CloudOptimizer Tools",
  :description => "Install additional scripts and tools for the command line",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/additional/cloudoptimizerwebui",
  :display_name => "CloudOptimizer Web Interface",
  :description => "Install a web interface",
  :required => "optional",
  :default => "Install",
  :choice => [ "Install", "Do not install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/beta",
  :display_name => "Install Beta Versions",
  :description => "Install beta versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :choice => [ "Do not install", "Install" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/remove",
  :display_name => "Remove CloudOptimizer Packages",
  :description => "Remove all or part of the CloudOptimizer configuration",
  :required => "optional",
  :default => "Do not remove",
  :choice => [ "Do not remove", "All Packages and Files", "All Packages (Retain Files)", "CloudController", "Web GUI" ],
  :recipes => [ "cloudoptimizer::removecloudoptimizer", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_packages/special",
  :display_name => "Install Special Versions",
  :description => "Install special versions of CloudOptimizer packages",
  :required => "optional",
  :default => "Do not install",
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::cloudoptcommon", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/cloud_credentials/aws/accesskey",
  :display_name => "AWS Access Key",
  :description => "Install your AWS access key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/cloud_credentials/aws/secretkey",
  :display_name => "AWS Secret Key",
  :description => "Install your AWS secret key on the server",
  :required => "optional",
  :default => "None",
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/supportview",
  :display_name => "SupportView",
  :description => "Create a support diagnostics file and, optionally, upload to CloudOpt",
  :required => "optional",
  :default => "Do not run SupportView",
  :choice => [ "Do not run SupportView", "Upload a full archive", "Upload a light archive", "Create a local archive", "Report to Audit Log only" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/user_feedback",
  :display_name => "Product Feedback",
  :description => "Automatically provide CloudOpt with information about how you use CloudOptimizer",
  :required => "optional",
  :default => "Basic feedback",
  :choice => [ "Basic feedback", "Detailed feedback", "No feedback" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/security/securitygroup",
  :display_name => "Create AWS Security Group",
  :description => "Create a security group for AWS that opens the CloudOptimizer TCP ports",
  :required => "optional",
  :default => "Do not open ports",
  :choice => [ "Do not open ports", "Open ports" ],
  :recipes => [ "cloudoptimizer::addsecuritygroup" "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/cifs/optimize_cifs",
  :display_name => "CIFS optimization",
  :description => "Enable or disable CIFS optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]
  
attribute "cloudoptimizer_configuration/encryption/ssl_termination",
  :display_name => "SSL termination",
  :description => "CloudOptimizer will terminate HTTPS connections to allow optimization",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer_configuration/encryption/upstream_verification",
  :display_name => "Upstream certificate verification",
  :description => "CloudOptimizer will verify a valid server certificate when SSL termination is enabled",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "cloudoptimizer::installcloudoptimizer", "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/web_interface/webui_login",
  :display_name => "Web interface login",
  :description => "User name for the CloudOptimizer web interface",
  :required => "optional",
  :default => "admin",
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]

attribute "cloudoptimizer/web_interface/webui_passwd",
  :display_name => "Web interface password",
  :description => "Password for the CloudOptimizer web interface",
  :required => "optional",
  :default => "letmein",
  :recipes => [ "cloudoptimizer::installcloudoptimizer",  "cloudoptimizer::configurecloudoptimizer", "cloudoptimizer::cloudoptcommon" ]