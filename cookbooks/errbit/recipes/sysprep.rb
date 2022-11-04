#
# Cookbook:: errbit
# Recipe:: sysprep
#
# Copyright:: 2022, Serghei Vrazovski, All Rights Reserved.

# Attributes check construction
# file node['file'] do
#  content 'Test if attributes are working'
# end
apt_update 'UPDATE!!!!!!!!!!!!!!!!!!!!!!!update' do
  action :update
end

%w(curl g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev).each do |pack|
  res = package pack do
    action :nothing
  end
  res.run_action(:install)
end

apt_package 'git' do
  action :install
  # not_if "test -f /usr/bin/git"
  not_if { ::File.exist?('/usr/bin/git') }
end

execute 'Set timezone' do
  command 'sudo timedatectl set-timezone Europe/Chisinau'
end

directory node['errbit']['app_path'] do
  recursive true
  action :delete
end

directory node['errbit']['app_path'] do
  owner node['errbit']['user']
  group node['errbit']['group']
  mode '0755'
  recursive true
  action :create
end

execute 'Git clone errbit application' do
  cwd node['errbit']['app_path']
  command 'rm -rf {*,.*}'
  command 'git clone https://github.com/errbit/errbit.git .'
end
