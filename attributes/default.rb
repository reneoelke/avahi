#
# Cookbook Name:: avahi
# Attributes:: default
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

node.default[:avahi] = {}
node.default[:avahi][:daemon] = {}
node.default[:avahi][:daemon][:conf] = {}

# [server]
node.default[:avahi][:daemon][:conf][:server] = {
	"host-name" => "#{node[:hostname]}",
	"domain-name" => "local",
	"use-ipv4" => "yes",
	"use-ipv6" => "no",
	"allow-interfaces" => "eth1",
	"enable-dbus" => "yes"
}

# [wide-area]
node.default[:avahi][:daemon][:conf][:wide_area] = {
	"enable-wide-area" => "yes"
}

# [publish]
node.default[:avahi][:daemon][:conf][:publish] = {
	"publish-addresses" => "yes",
	"publish-hinfo" => "yes",
	"publish-domain" => "yes"
}

# [reflector]
node.default[:avahi][:daemon][:conf][:reflector] = {}

# [rlimits]
node.default[:avahi][:daemon][:conf][:rlimits] = {
	"rlimit-core" => 0,
	"rlimit-data" => 4194304,
	"rlimit-fsize" => 0,
	"rlimit-nofile" => 300,
	"rlimit-stack" => 4194304,
	"rlimit-nproc" => 3
}
