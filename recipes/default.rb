#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


if node['platform'] == 'centos'
  yum_package 'epel-release' do
    action :install
  end
end

user node['nginx']['user'] do
  action :create
end

group node['nginx']['user'] do
  action :create
end

package 'nginx' do
  action :install
end

directory node['nginx']['datadir'] do
  recursive true
  action :create
end

cookbook_file "#{node['nginx']['datadir']}/index.html" do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  variables ({
    port: node['nginx']['port'],
    user: node['nginx']['user']
  })
  notifies :restart, 'service[nginx]', :delayed
end


service 'nginx' do
  action :enable
end
