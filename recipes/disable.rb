#
# Cookbook Name:: simple_firewall
# Recipe:: disable
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

package 'iptables'

execute 'disable-simple-firewall' do
  command '/etc/network/if-post-down.d/simple_firewall'
end

%w{/etc/network/if-pre-up.d/simple_firewall /etc/network/if-post-down.d/simple_firewall}.each do |script|
  file script do
    action :delete
  end
end