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

  context 'methods' do
    it 'can encrypt a message' do
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        dates: "040895"
      }

      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  end
end
