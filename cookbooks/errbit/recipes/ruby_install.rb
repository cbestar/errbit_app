#
# Cookbook:: errbit
# Recipe:: ruby_install using rbenv
#
# Copyright:: 2022, Serghei vrazovski, All Rights Reserved.

execute 'RBENV Installation' do
   command 'curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash'
end

bash "run bundle install in app directory" do
    code <<-EOH
    echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> home/vagrant/.bashrc
   EOH
end

bash "run bundle install in app directory" do
    code <<-EOH
    echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
    EOH
end

bash 'SOURCE' do
    code 'source "/home/vagrant/.bashrc"'
end

bash "run bundle install in app directory" do
    code 'source /home/vagrant/.bashrc'
end

#bash 'ruby install' do
#    code '/home/vagrant/.rbenv/bin/rbenv install 2.7.6'
#    not_if "ruby -v | grep \'#{node['errbit']['rubyver']}\'"
#end

execute 'ruby install' do
    command "/home/vagrant/.rbenv/bin/rbenv install \'#{node['errbit']['rubyver']}\'"
    #not_if "ruby -v | grep \'#{node['errbit']['rubyver']}\'"
    not_if "test -f /home/vagrant/.rbenv/versions/2.7.6/bin/ruby"
end

execute "chown .rbenv" do
    command "chown -R vagrant:vagrant /home/vagrant/.rbenv"
    user 'root'
  end

 execute 'Set global ruby version 2.7.6' do
    user 'vagrant'
    command '/home/vagrant/.rbenv/bin/rbenv global 2.7.6'
end







