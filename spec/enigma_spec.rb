require 'date'
require './lib/enigma'


RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  context 'it exists' do
    expect(@enigma).to be_instance_of Enigma
  end
end
