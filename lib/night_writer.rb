message_file = File.open(ARGV[0], "r")
new_file = File.new(ARGV[1], "w")
character_count = File.readlines("message.txt").join.length
puts "Created 'braille.txt' containing #{character_count} characters"