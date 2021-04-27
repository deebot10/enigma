require './lib/encryptable'
require 'date'

class Enigma
  include Encryptable

  attr_reader :key,
              :date

  def initialize
    @alphabet     = ("a".."z").to_a << " "
    @key_range    = ("A".."D").each_with_object({}) { |chr, hash| hash[chr] = 0 }
    @offset_range = ("A".."D").each_with_object({}) { |chr, hash| hash[chr] = 0 }
    @final_range = {}
  end

  def encrypt(message, key = "0" + rand(1000...9999).to_s, date = Date.today.strftime('%d%m%y'))
    key_range_method(key)
    offset_range_method(date)
    final_range_method
    encrypted_phrase = ""
    encrypt_magic(message).each_with_index {|idx, index| encrypted_phrase << "#{@alphabet[encrypt_magic(message)[index].remainder(27)]}"}
    {encryption: encrypted_phrase,
      key: key,
      date: date
    }
  end

  def encrypt_magic(message)
    character_index = []
    shifts = []
    character_shifts = []
    message_array(message).each {|letter| character_index << @alphabet.index(letter)}
    50.times { shifts << @final_range.values}
    final_shifts = shifts.flatten.first(message_array(message).count)
    character_index.each_with_index do |letter, index1|
      final_shifts.each_with_index do |char, index2|
        character_shifts << (letter + char) if index1 == index2
      end
    end
    character_shifts
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    key_range_method(key)
    offset_range_method(date)
    final_range_method
    encrypted_phrase = ""
    decrypt_magic(message).each_with_index {|idx, index| encrypted_phrase << "#{@alphabet[decrypt_magic(message)[index].remainder(27)]}"}
    {decryption: encrypted_phrase,
      key: key,
      date: date
    }
  end

  def decrypt_magic(message)
    character_index = []
    shifts = []
    character_shifts = []
    message_array(message).each {|letter| character_index << @alphabet.index(letter)}
    50.times { shifts << @final_range.values}
    final_shifts = shifts.flatten.first(message_array(message).count)
    character_index.each_with_index do |letter, index1|
      final_shifts.each_with_index do |char, index2|
        character_shifts << (letter - char) if index1 == index2
      end
    end
    character_shifts
  end
end
