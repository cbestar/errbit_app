#
# Cookbook:: errbit
# Recipe:: install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

#package 'gem' do
#    action :install
#end

#execute 'Bundler installation' do
#    command 'gem install bundler'
#end

#bash "run bundle install in app directory" do
#    cwd node[:bundler][:apps_path]
#    code "bundle install"
#  end

execute "Bundle install" do
    cwd node['errbit']['app_path']
    user 'vagrant'
    command "bundle install"
end



