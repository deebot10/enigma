require './lib/enigma'

handle = File.open(ARGV[0], 'r')
message = handle.read.chomp
handle.close
enigma = Enigma.new
message_converted = enigma.decrypt(message, ARGV[2], ARGV[3] = Date.today.strftime('%d%m%y'))

encryption = File.open(ARGV[1], 'w')
encryption.write(message_converted[:decryption])
encryption.close

puts "Created #{ARGV[1]} with the key #{message_converted[:key]} and date #{message_converted[:date]}"
