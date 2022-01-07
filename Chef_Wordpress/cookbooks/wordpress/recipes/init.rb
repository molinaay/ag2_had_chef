apt_update 'Update the apt cache daily' do
    frequency 86400
    action :periodic
  end
  
include_recipe '::instalador_dependencias'
include_recipe '::instalador_aplicacion'
include_recipe '::configurador_apache'
include_recipe '::configurador_bd'
include_recipe '::configurador_app'