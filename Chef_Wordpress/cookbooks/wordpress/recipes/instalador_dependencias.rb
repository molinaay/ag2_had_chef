

case node[:platform]
when 'redhat', 'centos'
   package 'wget'

  execute 'actualizar_paquetes' do
    command  "yum install https://repo.ius.io/ius-release-el7.rpm -y"
  end

  package 'httpd'

  package 'ghostscript'

  execute 'agregar_mysl_repositorio' do
    command  "wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm"
  end
  execute 'agregar_mysl_repositorio' do
    command  "md5sum mysql80-community-release-el7-3.noarch.rpm"
  end
  execute 'agregar_mysl_repositorio' do
    command  "rpm -ivh mysql80-community-release-el7-3.noarch.rpm"
  end
  execute 'instalar_mysql' do
    command  "yum install mysql-server -y"
  end
  
  package 'mod_php73'
  package 'php73-bcmath'
  package 'php73-cli'
  package 'php73-gd'
  package 'php73-ldap'
  package 'php73-mbstring'
  package 'php73-mysqlnd'
  package 'php73-soap'



when 'ubuntu', 'debian'

  package 'apache2'

  package 'ghostscript'

  package 'libapache2-mod-php'

  package 'mysql-server'

  package 'php'

  package 'php-bcmath'

  package 'php-curl'

  package 'php-imagick'

  package 'php-intl'

  package 'php-json'

  package 'php-mbstring'

  package 'php-mysql'

  package 'php-xml'

  package 'php-zip'
end

remote_file node[:wp_cli][:path] do
  source 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  mode 00755
  action :create_if_missing
end