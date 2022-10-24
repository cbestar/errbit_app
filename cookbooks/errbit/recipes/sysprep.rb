#
# Cookbook:: errbit
# Recipe:: sysprep
#
# Copyright:: 2022, Serghei Vrazovski, All Rights Reserved.

# Attributes check construction
file node['file'] do
  content 'Test if attributes are working'
end

apt_update 'UPDATE BEFORE DEPENDENSIES INSTALLATION' do
  action :update
end

#apt_update 'update apt cache' do
    #ignore_failure true
    #action :update
#end

#%w(curl g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev).each do |pack|
#  res = package pack do
#    action :nothing
#  end
#  res.run_action(:install)
#end

apt_package 'git' do
    action :install
    not_if "test -f /usr/bin/git"
end

directory '/home/vagrant/errbit_app' do
    recursive true
    action :delete
end

directory '/home/vagrant/errbit_app' do
    owner node['errbit']['user']
    group node['errbit']['group']
    mode '0755'
    recursive true
    action :create
end

execute 'Git clone errbit application' do
    cwd '/home/vagrant/errbit_app'
    command 'rm -rf {*,.*}'
    command 'git clone https://github.com/errbit/errbit.git .'
end




