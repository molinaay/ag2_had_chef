template "#{node['wordpress']['document_root']}/crear_bd.sql" do
    source 'crear_bd.sql.erb'
end

execute 'acciones_wordpress' do
    command  "mysql -u root < #{node['wordpress']['document_root']}/crear_bd.sql"
end

template "#{node['wordpress']['document_root']}/wp-config.php" do
    source 'wp-config.php.erb'
end