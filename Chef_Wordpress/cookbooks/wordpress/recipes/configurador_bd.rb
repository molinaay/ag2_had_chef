case node[:platform]
 when 'redhat', 'centos'

    template "#{node['wordpress']['document_root']}/asignar_password_root.sql" do
      source 'asignar_password_root.sql.erb'
    end
   
    execute 'set-environment_MYSQLD_OPTS' do
        command  'systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"'
    end

    execute 'inicar_mysql_service' do
        command  "systemctl start mysqld"
    end

    execute 'asignar_password_root' do
        command  "mysql -u root < #{node['wordpress']['document_root']}/asignar_password_root.sql"
    end
 end

template "#{node['wordpress']['document_root']}/crear_bd.sql" do
    source 'crear_bd.sql.erb'
end

case node[:platform]
    when 'redhat', 'centos'
        execute 'acciones_wordpress' do
            command  "mysql --user=root --password=Nuevo123* < #{node['wordpress']['document_root']}/crear_bd.sql"
        end
    when 'ubuntu', 'debian'
        execute 'acciones_wordpress' do
            command  "mysql -u root < #{node['wordpress']['document_root']}/crear_bd.sql"
        end
end

template "#{node['wordpress']['document_root']}/wp-config.php" do
    source 'wp-config.php.erb'
end