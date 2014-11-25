name             'sprout-mongo'
maintainer       'Myself, for now'
maintainer_email 'john.bernas@gmail.com'
license          'MIT'
description      'Chef Recipes to install and configure Mongo DB on OS X'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports         'mac_os_x'
depends          'homebrew', '>= 1.5.4'
depends          'sprout-base'
