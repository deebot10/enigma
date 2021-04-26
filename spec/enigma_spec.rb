require 'date'
require './lib/enigma'
require 'date'


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
        date: "040895"
      }

      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)

      # expected = {
      #   encryption: "keder",
      #   key: "02715",
      #   dates: "040895"
      # }
      #
      # expect(@enigma.encrypt("hello", "02715", "040895")).to eq(expected)
    end

    it 'can decrypt a message' do
      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    xit 'can encrypt a message with todays date'
    expected = {
      decryption: "hello world",
      key: "02715",
      date: Date.parse
    }
    expect(@enigma.encrypt("hello world", "02715")).to eq()
  end
end
