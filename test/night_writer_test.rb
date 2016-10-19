require 'minitest/autorun'
require 'minitest/pride'

require './test/night_writer.rb'

class NightWriterTest < Minitest::Test
  def test_it_exists
    assert NightWriterTest
  end

  def test_it_opens_a_file_with_text_and_read_it
    reader = File.open("english.txt", "r")
    contents = reader.read
    assert_kind_of String, contents
  end

  def test_it_opens_a_file_without_text_and_read_it
    reader = File.open("braille.txt", "r")
    contents = reader.read
    assert_equal contents, ""
  end

  def test_character_count_counts
  	reader = File.open("english.txt", "r")
    contents = reader.read
    character_count = contents.length
    assert_equal contents.length, character_count
  end
  
end