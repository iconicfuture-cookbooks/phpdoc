#
# Cookbook Name:: phpdoc
# Recipe:: composer
#
# Copyright 2013-2014, Escape Studios
#

include_recipe 'composer'

phpdoc_dir = "#{Chef::Config[:file_cache_path]}/phpdoc"

directory phpdoc_dir do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

# figure out what version to install
if node['phpdoc']['version'] != 'latest'
  version = node['phpdoc']['version']
else
  version = '*.*.*'
end

# composer.json
template "#{phpdoc_dir}/composer.json" do
  source 'composer.json.erb'
  owner 'root'
  group 'root'
  mode 0600
  variables(
    :version => version,
    :bindir => node['phpdoc']['prefix']
  )
end

# composer update
execute 'phpdoc-composer' do
  user 'root'
  cwd phpdoc_dir
  command 'composer update'
  action :run
end
