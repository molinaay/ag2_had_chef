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

end


