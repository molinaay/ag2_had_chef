require'spec_helper'

if os[:family] == 'ubuntu' 
  describe command('curl http://localhost:80') do 
      its(:stdout) { should match /""/ } 
  end
end

if os[:family] =='redhat'
  describe command('curl http://localhost:80') do 
    its(:stdout) { should match /""/ } 
  end
end
