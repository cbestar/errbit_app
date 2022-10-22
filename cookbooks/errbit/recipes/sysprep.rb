#
# Cookbook:: errbit
# Recipe:: sysprep
#
# Copyright:: 2022, Serghei Vrazovski, All Rights Reserved.

apt_update 'update apt cache' do
    ignore_failure true
    action :update
end

include_recipe "sc-mongodb::default"

apt_package 'git' do
    action :install
    not_if "test -f /usr/bin/git"
end

directory '/home/vagrant/errbit_app' do
    recursive true
    action :delete
end

directory '/home/vagrant/errbit_app' do
    owner 'vagrant'
    group 'vagrant'
    mode '0755'
    recursive true
    action :create
end

execute 'Git clone errbit application' do
    cwd '/home/vagrant/errbit_app'
    command 'rm -rf {*,.*}'
    command 'git clone https://github.com/errbit/errbit.git .'
end



