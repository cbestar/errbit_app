#
# Cookbook:: errbit
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe 'errbit::sysprep'
include_recipe 'errbit::ruby_install'
include_recipe 'errbit::mongo_install'
include_recipe 'errbit::install'
