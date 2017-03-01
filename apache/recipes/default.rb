#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true
  action [ :enable, :start ]
end

node.default['apache']['indexfile'] = 'index2.html'

cookbook_file '/var/www/html/index.html' do
  source node['apache']['indexfile']
  owner 'root'
  group 'root'
  mode 00644
end
