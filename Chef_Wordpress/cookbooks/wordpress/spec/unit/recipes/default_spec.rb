require 'spec_helper'

describe 'wordpress::instalador_dependencias' do
    platform 'ubuntu'

    context 'file and necessary package' do
        it "necessary package" do
            expect(chef_run).to install_package("php") 
        end

        it 'ejecucion correcta' do
            expect { chef_run }.to_not raise_error
        end

    end

    # context "with 'source' as install_method" do
    #   
    #   override_attributes['vim']['install_method'] = 'source' 

    #   it "should include the vim_pruebas_chef::source recipe when install_method='source'" do 
    #     expect(chef_run).to include_recipe('vim_pruebas_chef::source') 
    #   end
    # end

end


