#
# Cookbook Name:: avahi
# Recipe:: aliases
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

package "python-avahi"
package "python-pip"

execute "Upgrade pip" do
  command "pip install --upgrade pip"
end

execute "Install python library avahi-aliases" do
  command "pip install --force-reinstall #{node[:avahi][:aliases][:package_url]}"
end

service "avahi-aliases" do
  provider Chef::Provider::Service::Upstart
  supports [:start, :stop, :restart]
  action :nothing
end

template "/etc/avahi/aliases.d/domains" do
  source "etc/avahi/aliases.d/domains.erb"
  mode   "0644"
  owner  "root"
  group  "root"
  variables(
    :domains => node[:avahi][:aliases][:domains]
  )
  notifies :restart, "service[avahi-aliases]"
  # not_if do
  #   node[:avahi][:aliases][:domains].empty?
  # end
end
