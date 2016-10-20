require 'minitest/autorun'
require 'minitest/pride'

require './lib/night_write.rb'

class NightWriteTest < Minitest::Test

  def test_it_exists
    assert NightWriteTest
  end

  def test_it_reads_english_txt
    read = NightWriter.new
    assert_equal "Lorem ipsum dolor.", read.file_reader(english.txt)
  end

  def test_it_writes_braille_to_braille_txt
    write = NightWriter.new
    assert_equal "", write.write_braille(braille.txt)
  end

  def test_it_counts_incoming_characters
    count = NightWriter.new
    assert_equal 18, count.character_counter("Lorem ipsum dolor.")
  end

end