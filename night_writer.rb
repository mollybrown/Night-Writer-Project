class NightWriter

	# def initialize
	# 	@contents = contents
	# end

	def file_reader
		reader = File.open("english.txt", "r")
		contents = reader.read
		puts contents
	end

	# def file_writer
	# 	writer = File.open("braille.txt", "w")
	# 	contents = writer.write
	# 	puts contents
	# end

	# def character_counter(contents)
	# # 	#count number of characters (individual letters) from english.txt.
	# character_count = @contents.length
	# puts character_count

	#end

end

NightWriter.new.file_reader