#
# Cookbook:: errbit
# Recipe:: ruby_install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

apt_package 'ruby' do
    action :install
    not_if "test -f /usr/bin/ruby"
end