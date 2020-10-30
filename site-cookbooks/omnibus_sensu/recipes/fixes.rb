#
# Cookbook Name:: omnibus_sensu
# Recipe:: fixes
#
# Copyright (c) 2020 Sensu, All Rights Reserved.

if node["platform"] == "windows"
  msys_repo = "http://repo.msys2.org/msys"

  pkg_file = "msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
  remote_file "c:/#{pkg_file}" do
    source "#{msys_repo}/x86_64/#{pkg_file}"
    action :nothing
  end.run_action(:create)

  sig_file = "msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
  remote_file "c:/#{sig_file}" do
    source "#{msys_repo}/x86_64/#{sig_file}"
    action :nothing
  end.run_action(:create)

  execute "pacman-key --verify c:/#{sig_file}" do
    action :nothing
  end.run_action(:run)

  execute "pacman -U c:/#{pkg_file}" do
    action :nothing
  end.run_action(:run)
end
