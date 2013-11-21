#
# Cookbook Name:: avahi
# Attributes:: aliases
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

node.default[:avahi][:aliases] = {}
node.default[:avahi][:aliases][:package_url] = "git+git://github.com/till/avahi-aliases.git@topics/make-it-run"
node.default[:avahi][:aliases][:domains] = []
