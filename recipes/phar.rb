#
# Cookbook Name:: phpdoc
# Recipe:: phar
#
# Copyright 2013-2014, Escape Studios
#

if node['phpdoc']['install_dir'] != ""
    phpdoc_dir = node['phpdoc']['install_dir']
else
    phpdoc_dir = "#{Chef::Config['file_cache_path']}/phpdoc"
end

directory phpdoc_dir do
    owner "root"
    group "root"
    mode 0755
    action :create
end

remote_file "#{phpdoc_dir}/phpdoc.phar" do
    source node['phpdoc']['phar_url']
    mode 0755
end