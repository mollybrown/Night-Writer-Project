
require './translator.rb'
require 'pry'

class NightWriter

	def initialize
		@translation = Translator.new
	end							

	def file_reader
		text_reader = File.open(ARGV[0], "r")
		@incoming_text = text_reader.read
		text_reader.close
	end

	def translate_to_braille_l1
		@translation.translate_text_to_braille_l1(@incoming_text.downcase)
	end	

	def translate_to_braille_l2
		@translation.translate_text_to_braille_l2(@incoming_text.downcase)
	end	

	def translate_to_braille_l3
		@translation.translate_text_to_braille_l3(@incoming_text.downcase)
	end

	def get_braille
		@braille = @translation.combine_all_translated_text
	end	

	def write_braille
		braille_writer = File.open(ARGV[1], 'w')
		braille_writer.write(@braille)
	end

	def character_counter
		@character_count = @incoming_text.chomp.length
	end

	def output_message_to_terminal
		puts "Created '#{ARGV[1]}' containing #{@character_count} characters."
	end 

end

night_writer = NightWriter.new
night_writer.file_reader
night_writer.character_counter
night_writer.output_message_to_terminal
night_writer.translate_to_braille_l1
night_writer.translate_to_braille_l2
night_writer.translate_to_braille_l3
night_writer.get_braille
night_writer.write_braille