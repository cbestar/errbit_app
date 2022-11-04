#
# Cookbook:: errbit
# Recipe:: start_server
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

execute 'errbit bootstrap' do
    cwd node['errbit']['app_path']
    command '/home/vagrant/.rbenv/versions/2.7.6/bin/bundle exec /home/vagrant/.rbenv/versions/2.7.6/bin/rails server'
  end