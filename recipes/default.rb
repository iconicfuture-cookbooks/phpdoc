#
# Cookbook Name:: phpdoc
# Recipe:: default
#
# Copyright 2013, Escape Studios
#

include_recipe "php"

#install an XSLTProcessor (otherwise "The XSL writer was unable to find your XSLTProcessor"-phpDocumentor.EMERGENCY will be raised)
package "php5-xsl" do
	action :upgrade
end

#PHP Extension and Application Repository PEAR channel
pearhub_chan = php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
	channel pearhub_chan.channel_name
	action :upgrade
end

#phpDocumentor PEAR channel
pearhub_chan = php_pear_channel "pear.phpdoc.org" do
	action :discover
end

#upgrade phpDocumentor
php_pear "phpDocumentor" do
	channel pearhub_chan.channel_name
	if node[:phpdoc][:version] != "latest"
		version "#{node[:phpdoc][:version]}"
	end
	action if node[:phpdoc][:version] == "latest" ? :upgrade : :install
end