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

#execute 'wp_cli_download' do
#    command 'curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
#  end

remote_file node[:wp_cli][:path] do
    source 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
    mode 00755
    action :create_if_missing
end