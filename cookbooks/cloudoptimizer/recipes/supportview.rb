#
# Cookbook Name: SupportView
#
# Copyright CloudOpt, Inc.  All rights reserved.

log "========== Beginning SupportView  =========="

case node[:cloudoptimizer][:support][:supportview]
when "Upload a full archive"
  execute "supportview" do
    command "supportview -u"
  end
when "Upload a light archive"
  execute "supportview" do
    command "supportview -l"
  end
when "Create a local archive"
  execute "supportview" do
    command "supportview"
  end
end

log "========== Ending SupportView  =========="

