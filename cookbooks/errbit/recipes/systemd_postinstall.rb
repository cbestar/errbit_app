#
# Cookbook:: errbit
# Recipe:: systemd_postinstall
#
# Copyright:: 2022, The Authors, All Rights Reserved.

execute 'Daemon reload' do
    command 'systemctl daemon-reload'
end

execute 'Start rails.services' do
    command 'systemctl start rails'
end