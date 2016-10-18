class NightWriter

	attr_accessor :contents
								:character_count

	def file_reader
		reader = File.open("english.txt", "r")
		@@contents = reader.read
		#puts @contents
	end

	def file_writer
		writer = File.open("braille.txt", "w")
		contents = writer.write
		writer.close
		#puts contents
	end

	def character_counter
		@@character_count = @@contents.length #need class var to make it avaialble w/i seperate runner class
		#puts @@character_count
	end

end

nw = NightWriter.new
nw.file_reader
nw.character_counter

