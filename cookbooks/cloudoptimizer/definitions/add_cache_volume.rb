################################################################################
# Install and use an EBS volume for caching
################################################################################
# If the user chooses to use an EBS volume for caching, create, attach, and
# mount the volume.  Set the cache directory to the mount point of the EBS
# volume so that this script will later configure the cache directory correctly.
################################################################################

#if node[:cloudoptimizer_configuration][:byte_cache][:ebs_volume_size] != '0'
#  log "EBS cache volume: creating EBS volume."
#  @ec2 = RightAws::Ec2.new(node[:cloudoptimizer][:cloud_credentials][:aws][:accesskey],node[:cloudoptimizer][:cloud_credentials][:aws][:secretkey])
#  volume_name = @ec2.create_volume('',50,'us-east-1a')
#  log "EBS cache volume: created #volume_name.aws_id"
#  attach_status = @ec2.attach_volume(volume_name.aws_id,'','/dev/sdh')
#  log "Attached #attach_status.aws_id to #attach_status.aws_instance_id with result #attach_status.aws_status"
#end