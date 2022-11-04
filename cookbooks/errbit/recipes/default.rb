#
# Cookbook:: errbit
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

apt_update 'update' do
  compile_time true
  action 'update'
end

include_recipe 'errbit::sysprep'
include_recipe 'errbit::ruby_install'
include_recipe 'errbit::mongo_install'
include_recipe 'errbit::install'
include_recipe 'errbit::start_server'
