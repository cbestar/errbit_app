#
# Cookbook:: errbit
# Recipe:: mongo_install
#
# Copyright:: 2022, The Authors, All Rights Reserved.

apt_package 'gnupg' do
   action :install
   not_if "test -f /usr/bin/gnupg"
end


execute 'Key import for MongoDB installation' do
   command 'wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -'
end


execute 'Add mongo repo' do
   command 'echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list'
end

apt_update 'update apt cache' do
    ignore_failure true
    action :update
end

apt_package 'mongodb-org' do
    action :install
#    not_if "test -f /usr/bin/git"
end

execute 'Start mongoDB' do
   command 'systemctl stop mongod'
end

# Enable and check if started
service 'mongod' do
   action [:enable, :start]   
end


