################################################################################
# Set up repositories
################################################################################
# CloudOpt runs on both Ubuntu and CentOS linux, which require different 
# repositories.  Detect the linux distribution and then install the appropriate 
# repository.
################################################################################
log "Repositories: Starting"
if node[:cloudoptimizer_packages][:special] == 'use tcs' && node[:cloudoptimizer][:version] == 'latest'
  case node[:platform]
    when "ubuntu"
      log "Repositories:Installing on Ubuntu; using apt repository."
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
      # Retrieve and install the repository list
      remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
        source "http://50.16.207.155/cloudopt-test.maverick.list"
      end
      # Retrieve the repository key file
      remote_file "/var/tmp/cloudopt.tc-key.asc" do
        source "http://50.16.207.155/cloudopt-test.gpg.key"
      end
      # Install the repository key file
      execute "apt-key" do
        command "apt-key add /var/tmp/cloudopt.tc-key.asc"
      end
      # Update the apt database
      execute "apt-get" do
        command "apt-get update"
      end
    when "centos"
      log "Repositories:Installing on CentOS; using yum repository."
      log "Repositories:Installing the test repository.  CloudOpt internal use only."
      # Retrieve the repository list
      remote_file "/var/tmp/CloudOpt-Testing.selfextracting" do
        source "http://50.16.196.194/CloudOpt-Testing.selfextracting"
        mode "0755"
      end

      # Install the repository list
      execute "CloudOpt.selfextracting" do
        command "/var/tmp/CloudOpt-Testing.selfextracting"
      end
  end
else
  case node[:platform]
    when "ubuntu"
      log "Repositories: Installing on Ubuntu; using apt repository."
      # Retrieve and install the repository list
      remote_file "/etc/apt/sources.list.d/cloudopt.maverick.list" do
        source "http://apt.cloudopt.com/cloudopt.maverick.list"
      end 

      # Retrieve the repository key file
      remote_file "/var/tmp/cloudopt.key.asc" do
        source "http://apt.cloudopt.com/cloudopt.key.asc"
      end

      # Install the repository key file
      execute "apt-key" do
        command "apt-key add /var/tmp/cloudopt.key.asc"
      end

      # Update the apt database
      execute "apt-get" do
        command "apt-get update"
      end
    when "centos"
      log "Repositories: Installing on CentOS; using yum repository."

      # Retrieve the repository list
      remote_file "/var/tmp/CloudOpt.selfextracting" do
        source "https://s3.amazonaws.com/rpm-cloudopt/CloudOpt.selfextracting"
        mode "0755"
      end

      # Install the repository list
      execute "CloudOpt.selfextracting" do
        command "/var/tmp/CloudOpt.selfextracting"
      end
  end
end
log "Repositories: Ending"