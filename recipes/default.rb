#
# Cookbook Name:: avahi
# Recipe:: default
#
# Copyright 2013, foobugs Oelke & Eichner GbR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "avahi-daemon"

template "/etc/avahi/avahi-daemon.conf" do
  source "etc/avahi/avahi-daemon.conf.erb"
  mode   "0644"
  owner  "root"
  group  "root"
  variables(
    :server_conf => node[:avahi][:daemon][:conf][:server],
    :wide_area_conf => node[:avahi][:daemon][:conf][:wide_area],
    :publish_conf => node[:avahi][:daemon][:conf][:publish],
    :reflector_conf => node[:avahi][:daemon][:conf][:reflector],
    :rlimits_conf => node[:avahi][:daemon][:conf][:rlimits]
  )
end

service "avahi-daemon" do
  supports :status => true, :restart => true, :reload => false
  action [ :restart ]
end