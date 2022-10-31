#
# Cookbook:: errbit
# Recipe:: mongo_install
#
# Copyright:: 2022, The Authors, All Rights Reserved.

apt_package 'gnupg' do
   action :install
   not_if "test -f /usr/bin/gnupg"
end

apt_repository 'mongodb' do
   uri 'https://repo.mongodb.org/apt/ubuntu'
   arch 'amd64'
   cache_rebuild true
   distribution 'focal/mongodb-org/6.0'
   key 'https://www.mongodb.org/static/pgp/server-6.0.asc'
   components ['multiverse']
   deb_src true
   action :add
end

# execute 'Key import for MongoDB installation' do
#   command 'wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -'
# end


# execute 'Add mongo repo' do
#   command 'echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list'
# end

apt_update 'update apt cache' do
    ignore_failure true
    action :update
end

apt_package 'mongodb-org' do
    action :install
    not_if "test -f /usr/bin/mongod"
end

# Enable and start service
service 'mongod' do
   action [:enable, :start]   
end


