require './translator.rb'
require 'pry'

class NightReader

	attr_accessor :incoming_text,
								:translation, 
								:braille,
								:character_count

	def initialize
		@translation = Translator.new
	end							

	def file_reader
		text_reader = File.open(ARGV[0], "r")
		@incoming_text = text_reader.read
		text_reader.close
	end

	# def translate_to_braille_l1
	# 	translation.translate_text_to_braille_l1(@incoming_text)
	# 	@braille = translation. #some translate method here
	# 	write_braille
	# end	

	# def write_braille
	# 	braille_writer = File.open(ARGV[1], 'w')
	# 	braille_writer.write(@braille)
	# end	

	def character_counter
		@character_count = @incoming_text.chomp.length
	end

	def output_message_to_terminal
		puts "Created '#{ARGV[1]}' containing #{@character_count} characters."
	end 

end

night_reader = NightReader.new
night_reader.file_reader
night_reader.character_counter
night_reader.output_message_to_terminal