handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

translated_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(translated_text)

writer.close

#enter in terminal: ruby file_i_o.rb english.txt braille.txt
#this will read english.txt, apply desired method, and write output in braille.txt