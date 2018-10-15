#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update "update_sources" do
  action :update
end

package "openjdk-8-jdk" do
  action :install
end
