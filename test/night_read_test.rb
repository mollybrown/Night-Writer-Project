require 'minitest/autorun'
require 'minitest/pride'

require './lib/night_read.rb'

class NightReadTest < Minitest::Test

  def test_it_exists
    assert NightReadTest
  end

  def test_it_reads_a_file_and_stores_contents
    file = NightWriter.new("braille.txt", "r")
    contents = file.read
    assert contents != nil
  end

  def test_it_writes_to_english_txt
    file = NightWriter.new("english.txt", "w")
    contents = file.write
    assert contents != nil
  end

  def test_it_counts_incoming_characters
    count = NightWriter.new
    assert_equal 6, count.character_counter("0....0")
  end

end