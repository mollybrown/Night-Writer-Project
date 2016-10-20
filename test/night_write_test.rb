require 'minitest/autorun'
require 'minitest/pride'

require './lib/night_write.rb'

class NightWriteTest < Minitest::Test

  def test_it_exists
    assert NightWriteTest
  end

  def test_it_reads_a_file_and_stores_contents
    file = NightWriter.new("english.txt", "r")
    contents = file.read
    assert contents != nil
  end

  def test_it_writes_to_braille_txt
    file = NightWriter.new("braille.txt", "w")
    contents = file.write
    assert contents != nil
  end

  def test_it_counts_incoming_characters
    count = NightWriter.new
    assert_equal 18, count.character_counter("Lorem ipsum dolor.")
  end

end