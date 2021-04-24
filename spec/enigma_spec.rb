require 'date'
require './lib/enigma'


RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  context 'it exists' do
    it 'exists' do
      expect(@enigma.class).to be(Enigma)
    end
  end
end
