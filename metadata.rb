name 'phpdoc'
maintainer 'Escape Studios'
maintainer_email 'dev@escapestudios.com'
license 'MIT'
description 'Installs/Configures phpdoc'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

%w( debian ubuntu redhat centos fedora scientific amazon ).each do |os|
  supports os
end

depends 'php'
depends 'composer'

recipe 'phpdoc', 'Installs phpdoc.'
recipe 'phpdoc::composer', 'Installs phpdoc using composer.'
recipe 'phpdoc::pear', 'Installs phpdoc using pear.'
recipe 'phpdoc::phar', 'Installs phpdoc using phar.'
