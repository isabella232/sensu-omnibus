#
# Cookbook Name:: omnibus_sensu
# Recipe:: fixes
#
# Copyright (c) 2020 Sensu, All Rights Reserved.

debian_8 = node["platform"] == "debian" && Gem::Version.new(node["platform_version"]) == Gem::Version.new(8)

if debian_8
  execute "ls /etc/apt/" do
    action :nothing
  end.run_action

  execute "cat /etc/apt/sources.list" do
    action :nothing
  end.run_action

  execute "ls /etc/apt/sources.list.d" do
    action :nothing
  end.run_action

  execute "cat /etc/apt/sources.list.d/*" do
    action :nothing
  end.run_action
end

if node["platform"] == "windows"
  msys_repo = "http://repo.msys2.org/msys"

  pkg_file = "msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
  remote_file "c:/#{pkg_file}" do
    source "#{msys_repo}/x86_64/#{pkg_file}"
    action :nothing
  end.run_action

  sig_file = "msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
  remote_file "c:/#{sig_file}" do
    source "#{msys_repo}/x86_64/#{sig_file}"
    action :nothing
  end.run_action

  execute "pacman-key --verify c:/#{sig_file}" do
    action :nothing
  end.run_action

  execute "pacman -U c:/#{pkg_file}" do
    action :nothing
  end.run_action
end
