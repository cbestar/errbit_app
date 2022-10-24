#
# Cookbook:: errbit
# Recipe:: install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

execute 'Bundler installation' do
    command 'gem install bundler'
end


execute 'Bundle install' do
    cwd '/home/vagrant/errbit_app'
    command 'bundle install'
end