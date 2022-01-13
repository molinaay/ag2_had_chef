case node[:platform]
when 'redhat', 'centos'
  directory '/etc/httpd/sites-available' do
        action :create
  end
   directory '/etc/httpd/sites-enabled' do
        action :create
   end

    template "#{node['wordpress']['ruta_sitio_apache_centos']}/wordpress.conf" do
    source 'virtual-hosts.conf.erb'
  end

when 'ubuntu', 'debian'
  template "#{node['wordpress']['ruta_sitio_apache']}/wordpress.conf" do
    source 'virtual-hosts.conf.erb'
  end

   execute 'acciones_wordpress' do
    command 'a2ensite wordpress | a2enmod rewrite | a2dissite 000-default | service apache2 reload'
  end
end


