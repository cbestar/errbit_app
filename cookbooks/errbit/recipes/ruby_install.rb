#
# Cookbook:: errbit
# Recipe:: ruby_install
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

execute 'RBENV Installation' do
    command 'curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash'
    command 'echo export PATH="$HOME/.rbenv/bin:$PATH" >> ~/.bashrc'
    command 'echo eval "$(rbenv init -)" >> ~/.bashrc'
    command 'echo source home/vagrant/.bashrc'
    action :run
    #command 'rbenv global 2.7.6'
end

#apt_package 'ruby' do
#    action :install
#    not_if "test -f /usr/bin/ruby"
#end
