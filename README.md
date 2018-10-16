# kibana

TODO: Enter the cookbook description here.

! Dont forget to change to solorunner !

Dont forget about .kitchen.yml, ubuntu version

In recipes, default
"apt_update "update_sources" do
  action :update
end"
"package "openjdk-8-jdk" do
  action :install
end"


If you have converge problem : delete the .kitchen file, delete vm then restart.

Oceane
