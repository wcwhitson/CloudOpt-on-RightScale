################################################################################
# Install cloudoptimizer
################################################################################
# Install and configure the CloudOptimizer packages.  This section must be 
# updated for each new release.  If not updated, the version lock input will not
# display new versions.  The RightScript will always install the latest version 
# available when the version lock is set to "latest."
################################################################################
# The version locking is kind of a pain the way it is done, but chef doesn't 
# appear to honor architecture in the package command as it should, at least on 
# RightScale.  I wasted a lot of time trying to get it to work before settling 
# on manually specifying the package options.  Thus, we have a lot of manual 
# labor here to determine which package to install when version locking is 
# selected.  We should revisit this in the future and see if we can simplify.
log "Install cloudoptimizer: Starting"
  log "Install cloudoptimizer: Installing CloudOptimizer version #{node[:cloudoptimizer][:version]}"
  case node[:platform]
  when "ubuntu"
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing the latest cloudoptimizer package."
      package "cloudoptimizer"
    else
      case node[:cloudoptimizer][:version]
      when "1.1.6"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "1.1.6"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "1.1.6"
              action :install
            end
        end
      when "1.1.5"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "1.1.5"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "1.1.5"
              action :install
            end
        end
      when "0.9.4"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.2-53"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "0.9.4-71"
              action :install
            end
        end
      when "0.9.3.2"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.2-53"
            action :install
          end
        when "i686"
          package "cloudoptimizer" do
            version "0.9.3.2-49"
            action :install
          end
      end
      when "0.9.3.1"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            package "cloudoptimizer" do
              version "0.9.3.1"
              action :install
            end
          when "i686"
            package "cloudoptimizer" do
              version "0.9.3.1"
              action :install
            end
        end
      end
    end
  when "centos"
    # Install EPEL, since not every RightImage seems to have it installed
    if node[:cloudoptimizer][:version] == 'latest'
      log "Install cloudoptimizer: Installing the latest cloudoptimizer package."
      execute "yum" do
        command "yum -y install cloudoptimizer"
      end
    else
      case node[:cloudoptimizer][:version] 
      when "1.1.6"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.6"
            end
          when "i686"
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.6"
            end
          end
      when "1.1.5"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.5"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer_1.1.5"
            end
          end
      when "0.9.4"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.4"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.4"
            end
        end
      when "0.9.3.2"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.2"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.2"
            end
          end
      when "0.9.3.1"
        case node[:languages][:ruby][:host_cpu]
          when "x86_64"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.1"
            end
          when "i686"
            log "Install cloudoptimizer: Installing EPEL."
            execute "rpm" do
              command "rpm -Uvh http://mirror.chpc.utah.edu/pub/epel/5/i386/epel-release-5-4.noarch.rpm"
            end
            execute "yum" do
              command "yum -y install cloudoptimizer-0.9.3.1"
            end
        end
      end
    end
  end
log "Install cloudoptimizer: Ending"