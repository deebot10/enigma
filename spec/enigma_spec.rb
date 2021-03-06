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
    end

    it 'can encrypt' do
      expected = {
        encryption: "keder",
        key: "02715",
        date: "040895"
      }

      expect(@enigma.encrypt("hello", "02715", "040895")).to eq(expected)
    end

    it 'can decrypt a message' do
      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    it 'can decrypt a message' do
      expected = {
        decryption: "hello",
        key: "02715",
        date: "040895"
      }
      expect(@enigma.decrypt("keder", "02715", "040895")).to eq(expected)
    end

    it 'can encrypt a message with todays date' do
      expected = {
        encryption: "qgfaxbqd ny",
        key: "02715",
        date: Date.today.strftime('%d%m%y')
        }
      expect(encrypted = @enigma.encrypt("hello world", "02715")).to eq(expected)

      expected = {
        decryption: "zcrwfybzijj",
        key: "02715",
        date: Date.today.strftime('%d%m%y')
        }
      expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
    end

    it 'can encrypt a message with a generated key and todays date' do
      x = @enigma.encrypt("hello world")
      expect(x[:key].class).to eq(String)
      expect(x[:key].length).to eq(5)
      expect(x[:date]).to eq(Date.today.strftime('%d%m%y'))
    end
  end
end
