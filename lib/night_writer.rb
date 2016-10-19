require './lib/translator.rb'

class NightWriter

	#attr_accessor :contents
				  #:character_count

	attr_reader :incoming_text

	def file_reader
		handle = File.open(ARGV[0], "r")
		@incoming_text = handle.read
		handle.close
	end

	def translate_incoming_to_outgoing
		translator = Translator.new
		@l1_transform
        @l2_transform
        @l3_transform
		translated_text = [@l1_transform, @l2_transform, @l3_transform]
	end

	def file_writer
		writer = File.open(ARGV[1], "w")
		writer.write(translated_text)
		writer.close
	end

	#def character_counter
		#@character_count = @incoming_text.length #need class var to make it avaialble w/i seperate runner class
		#puts @@character_count
	#end

end

nw = NightWriter.new
nw.file_reader
nw.translate_incoming_to_outgoing
nw.file_writer
#nw.character_counter


#enter in terminal: ruby night_writer.rb english.txt braille.txt
#this will read english.txt, apply desired method, and write output in braille.txt