#
# Cookbook:: errbit
# Recipe:: install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

package 'gem' do
    action :install
end

execute 'Bundler installation' do
    command 'gem install bundler'
end

execute "bundle-install" do
    #user "my_user"
    cwd "/home/vagrant/errbit_app"
    command "bundle install"
    action :run
  end



