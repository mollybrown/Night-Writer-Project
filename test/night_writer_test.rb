require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'

class NightWriterTest < Minitest::Test
  def test_it_exists
    assert NightWriterTest
  end

  # def test_it_opens_and_reads_a_file
  #   reader = NightWriter.new
  #   reader.file_reader
  #   contents = file.read
  #   assert contents != nil
  # end

  def test_it_reads_a_file_and_stores_contents
    file = File.open("english.txt", "r")
    contents = file.read
    assert contents != nil
  end

  # def test_it_opens_a_file_without_text_and_read_it
  #   reader = File.open("braille.txt", "r")
  #   contents = reader.read
  #   assert_equal contents, ""
  # end

  # def test_character_count_counts
  # 	reader = File.open("english.txt", "r")
  #   contents = reader.read
  #   character_count = contents.length
  #   assert_equal contents.length, character_count
  # end

  def test_it_opens_a_file_to_write
    file = File.open("braille.txt", "w")
    refute file.closed?
  end

  def test_it_opens_a_file_and_writes_to_it
    file = File.open("braille.txt", "w")
    file.write("abc")

  end
  
end