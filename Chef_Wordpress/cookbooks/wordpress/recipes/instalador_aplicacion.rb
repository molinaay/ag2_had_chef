directory "#{node['wordpress']['directorio']}" do
    action :create
end

remote_file "#{node['wordpress']['directorio']}/#{node['wordpress']['archivo_wordpress']}" do
    source "#{node['wordpress']['ruta_wordpress']}"
    action :create
end

archive_file "#{node['wordpress']['directorio']}/#{node['wordpress']['archivo_wordpress']}" do
    destination "#{node['wordpress']['directorio']}" 
end

execute 'extraer_wordpress' do
    command "tar xzvf #{node['wordpress']['directorio']}/#{node['wordpress']['archivo_wordpress']}"
    cwd "#{node['wordpress']['directorio']}"
  end