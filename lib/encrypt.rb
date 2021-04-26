require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read.chomp
handle.close
enigma = Enigma.new
message_converted = enigma.encrypt(message)

encryption = File.open(ARGV[1], 'w')
encryption.write(message_converted[:encryption])
encryption.close

puts "Created #{ARGV[1]} with the key #{message_converted[:key]} and date #{message_converted[:date]}"
