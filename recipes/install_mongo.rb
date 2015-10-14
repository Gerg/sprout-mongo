include_recipe 'homebrew'

homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'mongodb')
mongo_package = node['sprout']['mongo']['mongo_package']

package mongo_package

directory data_directory do
  action :delete
  recursive true
  not_if { node['sprout']['mongo']['preserve_dbs'] }
end

directory data_directory do
  action :create
  user node['current_user']
  not_if { node['sprout']['mongo']['preserve_dbs'] }
end
