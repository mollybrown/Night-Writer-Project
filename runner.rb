require 'night_writer.rb'

class Runner
#Inout message in terminal to run: require night writer to read message.txt, write braille.txt
#$ ruby ./lib/night_writer.rb english.txt braille.txt

#Ouput message to terminal 
#Created 'braille.txt' containing 256 characters

	def output_message_to_terminal
		puts "Created #{output_file_name} containing #{character_count} chrarcaters."
	end

end