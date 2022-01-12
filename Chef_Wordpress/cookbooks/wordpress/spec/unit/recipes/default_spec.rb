require 'spec_helper'

describe 'wordpress::instalador_dependencias' do
    platform 'ubuntu'
#prueba para ver instalacion de php
    context 'instalacion correcta de php' do
        it "paquete necesario se instala para php" do
            expect(chef_run).to install_package("php") 
        end
        
    end
#prueba para ver instalacion de mysql
    context 'instalacion de mysql' do
        it "paquete necesario se instala para mysql" do
            expect(chef_run).to install_package("mysql-server")
        end
    end
#prueba para ver instalacion de apache
    context 'instalacion de apache' do
        it "paquete necesario se instala para apache" do
            expect(chef_run).to install_package("apache2")
        end
#prueba para ver que no haya errores en la instalacion de los paquetes restantes
        it 'ejecucion correcta' do
            expect { chef_run }.to_not raise_error
        end

    end

end

describe 'wordpress::instalador_aplicacion' do
    platform 'ubuntu'
#prueba para ver que se descargara wordpress
    it "wordpress directory is created" do
            expect(chef_run).to create_remote_file("/srv/www/latest.tar.gz")
    end
end

describe 'wordpress::configurador_apache' do
    platform 'ubuntu'
#prueba para ver que se copie la configuracion de wordpress para apache
    it "fichero de config de apache con wordpress copiado" do
            expect(chef_run).to create_template("/etc/apache2/sites-available/wordpress.conf")
    end
end
