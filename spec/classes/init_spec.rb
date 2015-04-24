require 'spec_helper'
describe 'nco' do

  context 'with defaults for all parameters' do
    it { should contain_class('nco') }
  end
end
