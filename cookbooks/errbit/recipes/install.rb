#
# Cookbook:: errbit
# Recipe:: install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

# package 'gem' do
#    action :install
# end

# execute 'Bundler installation' do
#   command 'gem install bundler'
# end

# bash "run bundle install in app directory" do
#    cwd node[:bundler][:apps_path]
#    code "bundle install"
#  end

execute 'libv8-node install' do
  command '/home/vagrant/.rbenv/versions/2.7.6/bin/gem install libv8-node --version 16.10.0.0 --platform x86_64-linux-libc'
end

execute 'Chown app directory' do
  cwd node['errbit']['app_path']
  command "chown vagrant:vagrant . -R"
end

execute 'Bundle install' do
  cwd node['errbit']['app_path']
  command '/home/vagrant/.rbenv/versions/2.7.6/bin/bundle install'
end

execute 'errbit bootstrap' do
  cwd node['errbit']['app_path']
  command '/home/vagrant/.rbenv/versions/2.7.6/bin/bundle exec /home/vagrant/.rbenv/versions/2.7.6/bin/rake errbit:bootstrap'
end

# Temporary solution

execute 'link toi ruby binary' do
  command 'ln -s /home/vagrant/.rbenv/shims/ruby /usr/bin/ruby'
end
