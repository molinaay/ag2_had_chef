template "#{node['wordpress']['ruta_sitio_apache']}/wordpress.conf" do
    source 'virtual-hosts.conf.erb'
end

execute 'acciones_wordpress' do
    command 'a2ensite wordpress | a2enmod rewrite | a2dissite 000-default | service apache2 reload'
  end