include_recipe 'sprout-mongo::install_mongo'

launch_agents_path = File.expand_path(File.join(node.default['sprout']['home'], 'Library/LaunchAgents'))
directory launch_agents_path do
  action :create
  recursive true
  owner node['sprout']['user']
end

plist_filename = node['sprout']['mongo']['plist_filename']
mongo_name = node['sprout']['mongo']['mongo_name']
homebrew_root = '/usr/local'
mongo_install_path = File.join(homebrew_root, 'opt', mongo_name)
source_plist_filename = File.join(mongo_install_path, plist_filename)
launch_agent_plist_filename = File.join(launch_agents_path, plist_filename)

link launch_agent_plist_filename do
  to source_plist_filename
end

execute 'start the daemon' do
  command "launchctl load -w #{launch_agent_plist_filename}"
  user node['sprout']['user']
end

ruby_block 'wait four seconds for the database to start' do
  block do
    sleep 4
  end
end
