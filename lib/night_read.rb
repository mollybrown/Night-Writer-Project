require './translator.rb'
require 'pry'

# Translate Braille to English text
class NightReader

	def initialize
		@translation = Translator.new
	end							

	def file_reader
		braille_reader = File.open(ARGV[0], "r")
		@incoming_braille = braille_reader.read
		braille_reader.close
		print @incoming_braille
	end

	def translate_to_text_l1
		@translation.translate_braille_to_text_l1(@incoming_braille)
	end	

	# def translate_to_braille_l2
	# 	@translation.translate_text_to_braille_l2(@incoming_text)
	# end	

	# def translate_to_braille_l3
	# 	@translation.translate_text_to_braille_l3(@incoming_text)
	# end

	# def get_text
	# 	@text = @translation.combine_all_translated_braille
	# end	

	# def write_text
	# 	text_writer = File.open(ARGV[1], 'w')
	# 	text_writer.write(@text)
	# end

	# def character_counter
	# 	@character_count = @incoming_text.chomp.length
	# end

	def output_message_to_terminal
		puts "Created '#{ARGV[1]}' containing #{@character_count} characters."
	end 

end

night_reader = NightReader.new
night_reader.file_reader
# night_reader.character_counter
# night_reader.output_message_to_terminal
# night_reader.translate_to_braille_l1
# night_reader.translate_to_braille_l2
# night_reader.translate_to_braille_l3
# night_reader.get_braille
# night_reader.write_braille