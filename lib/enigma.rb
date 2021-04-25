class Enigma

  def initialize
    @alphabet     = ("a".."z").to_a << " "
    @key_range    = ("A".."D").each_with_object({}) { |chr, hash| hash[chr] = 0 }
    @offset_range = ("A".."D").each_with_object({}) { |chr, hash| hash[chr] = 0 }
    @final_range = {}
  end

  def encrypt(message, key = "key", date = "date")
    key_shift(key).each_with_index do |shift, index1|
      @key_range.keys.each_with_index do |key, index2|
          @key_range[key] += shift if index1 == index2
        end
      end
    @key_range
    date_array(date).each_with_index do |shift, index1|
      @offset_range.keys.each_with_index do |key, index2|
        @offset_range[key] += shift if index1 == index2
      end
    end
    @offset_range
    @final_range = @key_range.merge(@offset_range){|key, oldval, newval| newval + oldval}
    @final_range
    require "pry"; binding.pry
  end

  #encrypt method
  def key_shift(key)
    key_arrays(key).map { |key| key.join.to_i}
  end

  #encrypt method
  def key_arrays(key)
    keys = []
    split_keys(key).each_cons(2) {|x| keys.push(x)}
    keys
  end

    #encrypt method
  def split_keys(key)
    key.split(//).map {|chr| chr.to_i}
  end

    #encrypt method
  def date_manipulation(date)
    date = date.to_i**2
    date = date.to_s[-4..-1]
  end

   #encrypt method
  def date_array(date)
  x = date_manipulation(date).each_char.each_slice(1).map{|x| x.join}
    date_array_i = x.map do |date|
      date.to_i
    end
    date_array_i
  end
end
