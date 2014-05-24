#
# Cookbook Name:: phpdoc
# Recipe:: phar
#
# Copyright 2013-2014, Escape Studios
#

remote_file "#{node['phpdoc']['install_dir']}/phpdoc" do
  source node['phpdoc']['phar_url']
  mode 0755
end
