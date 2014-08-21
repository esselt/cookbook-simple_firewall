#
# Cookbook Name:: simple_firewall
# Recipe:: default
#
# Copyright 2013, HiST AITeL
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

package 'ufw' do
  action :remove
end

package 'iptables'

template '/etc/network/if-pre-up.d/simple_firewall' do
  source 'pre_up.erb'
  mode 0700
  owner 'root'
  group 'root'
  variables :rules => Hash[node[:simple_firewall][:rules].sort_by { |k,v| k.to_i }]
  notifies :run, 'execute[run-simple-firewall]', :delayed
end

template '/etc/network/if-post-down.d/simple_firewall' do
  source 'post_down.erb'
  mode 0700
  owner 'root'
  group 'root'
end

execute 'run-simple-firewall' do
  command '/etc/network/if-post-down.d/simple_firewall && /etc/network/if-pre-up.d/simple_firewall'
  action :nothing
end

