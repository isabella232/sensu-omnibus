#
# Cookbook Name:: fixes
# Recipe:: debian-8
#
# Copyright (c) 2020 Sensu, All Rights Reserved.

execute "rm /etc/apt/sources.list.d/backports.list" do
  action :run
end
