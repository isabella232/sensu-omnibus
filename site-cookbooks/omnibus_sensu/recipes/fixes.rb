#
# Cookbook Name:: omnibus_sensu
# Recipe:: fixes
#
# Copyright (c) 2020 Sensu, All Rights Reserved.

debian_8 = node["platform"] == "debian" && Gem::Version.new(node["platform_version"]) == Gem::Version.new(8)

if debian_8
  execute "ls /etc/apt/"
  execute "cat /etc/apt/sources.list"
  execute "ls /etc/apt/sources.list.d"
  execute "cat /etc/apt/sources.list.d/*"
end

if windows?
  execute "curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
  execute "curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
  execute "pacman-key --verify msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
  execute "pacman -U msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
end
