require'spec_helper'

if os[:family] == 'ubuntu' 
  describe file('/usr/local/bin/wp') do 
      it { should exist } 
  end
end

if os[:family] =='redhat'
  describe file('/usr/local/bin/wp') do 
    it { should exist }
  end
end