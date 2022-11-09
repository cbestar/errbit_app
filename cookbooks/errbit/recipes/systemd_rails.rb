#
# Cookbook:: errbit
# Recipe:: systemd_rails
#
# Copyright:: 2022, Serghei Vrazovski, All Rights Reserved.

systemd_unit 'rails.service' do
  content <<~EOU
  [Unit]
  Description=Puma HTTP Server
  After=network.target
  [Service]
  Type=simple
  WatchdogSec=10
  User=vagrant
  WorkingDirectory=/opt/errbit_app
  ExecStart=/home/vagrant/.rbenv/versions/2.7.6/bin/rails s -b 0.0.0.0
  Restart=always
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable]
end
