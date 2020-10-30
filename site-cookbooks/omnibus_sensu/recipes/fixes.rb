#
# Cookbook Name:: omnibus_sensu
# Recipe:: fixes
#
# Copyright (c) 2020 Sensu, All Rights Reserved.

debian_8 = node["platform"] == "debian" && Gem::Version.new(node["platform_version"]) == Gem::Version.new(8)

if debian_8
  execute "list_apt_dir" do
    command("ls /etc/apt/")
  end

  execute "show_sources_list" do
    command("cat /etc/apt/sources.list")
  end

  execute "list_sources_dir" do
    command("ls /etc/apt/sources.list.d")
  end

  execute "show_all_sources_list" do
    command("cat /etc/apt/sources.list.d/*")
  end
end
