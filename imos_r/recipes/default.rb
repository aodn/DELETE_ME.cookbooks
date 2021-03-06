#
# Cookbook Name:: imos_r
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "netcdf-bin"

execute "download_ncdf4_library" do
    command "wget http://cirrus.ucsd.edu/~pierce/ncdf/ncdf4_1.9.tar.gz"
    not_if { ::File.exists?("/home/vagrant/ncdf4_1.9.tar.gz")}
    cwd "/home/vagrant"
    user "vagrant"
    notifies :run, "execute[install_ncdf4_library]", :immediately
end

execute "install_ncdf4_library" do
    command "R CMD INSTALL ncdf4_1.9.tar.gz"    
    cwd "/home/vagrant"
    user "root"
    action :nothing
end

#r_package "ncdf4" do
#  action :install
#end

r_package "aqfig" do
	action :install
end

r_package "maps" do
	action :install
end

r_package "ggplot2" do
	action :install
end

r_package "raster" do
	action :install
end

r_package "sp" do
	action :install
end


