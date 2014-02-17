#
# Cookbook Name:: phpdoc
# Recipe:: default
#
# Copyright 2013-2014, Escape Studios
#

case node['phpdoc']['install_method']
    when "pear"
        include_recipe "phpdoc::pear"
    when "composer"
        include_recipe "phpdoc::composer"
    when "phar"
        include_recipe "phpdoc::phar"
end