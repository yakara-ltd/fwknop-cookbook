#
# Cookbook Name:: fwknop
# Recipe:: server
#
# Copyright (C) 2016 Yakara Ltd
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

case node['platform_family']
when 'debian'
  package 'fwknop-server'
else
  package 'fwknop'
end

include_recipe 'sysctl::default'

# force enabling ip forwarding
sysctl_param 'net.ipv4.ip_forward' do
  value 1
end

cfg = node['fwknop']
acc = cfg['access']
gpg = cfg['gpg']
cfgdir = cfg['conf_dir']

template "#{cfgdir}/access.conf" do
  source 'access.conf.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables(
    source: acc['source'],
    key: acc['key'],
    hmac_key: acc['hmac_key'],
    open_ports: acc['open_ports'],
    restrict_ports: acc['restrict_ports'],
    enable_forward_access: acc['enable_forward_access'],
    access_timeout: acc['timeout'],
    enable_cmd_exec: acc['enable_cmd_exec'],
    cmd_exec_user: acc['cmd_exec_user'],
    require_source_address: acc['require_source_address'],
    gpg_id: gpg['decrypt_id'],
    gpg_home_dir: gpg['home_dir'],
    gpg_passwd: gpg['passwd'],
    gpg_require_sig: gpg['require_sig'],
    gpg_remote_ids: gpg['remote_ids']
  )
end

template "#{cfgdir}/fwknopd.conf" do
  source 'fwknopd.conf.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables(
    interface: cfg['interface'],
    pcap_port: cfg['pcap_port'],
    pcap_portrange: cfg['pcap_portrange']
  )
end
