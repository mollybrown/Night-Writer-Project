require './translator.rb'
require 'pry'

class NightReader

	def initialize
		@translation = Translator.new
	end							

	def file_reader
		braille_reader = File.open(ARGV[0], "r")
		@incoming_braille = braille_reader.read
		braille_reader.close
	end

	def format_braille_for_translation
		@translation.format_braille(@incoming_braille)
	end	

	def translate_to_braille
		@text = @translation.combine_braille_lines_for_output
	end  	

	def write_text
		text_writer = File.open(ARGV[1], 'w')
		text_writer.write(@text)
	end

	def character_counter
		@character_count = @text.chomp.length
	end

	def output_message_to_terminal
		puts "Created '#{ARGV[1]}' containing #{@character_count} characters."
	end 

end

night_reader = NightReader.new
night_reader.file_reader
night_reader.format_braille_for_translation
night_reader.translate_to_braille
night_reader.character_counter
night_reader.output_message_to_terminal
night_reader.write_text