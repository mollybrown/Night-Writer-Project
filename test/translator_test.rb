require 'minitest/autorun'
require 'minitest/pride'

require './lib/translator.rb'

class TranslatorTest < Minitest::Test

  def test_it_exists
    assert TranslatorTest
  end

  def test_it_translates_l1_to_braille
    line_1 = Translator.new
    assert_equal [["0."], ["0."], ["00"]], line_1.translate_text_to_braille_l1("abc")
  end

  def test_it_translates_l2_to_braille
    line_2 = Translator.new
    assert_equal [[".0"], [".0"], ["0."]], line_2.translate_text_to_braille_l2("def")
  end

  def test_it_translates_l3_to_braille
    line_3 = Translator.new
    assert_equal [[".."], [".."], [".."]], line_3.translate_text_to_braille_l3("ghi")
  end

  def test_it_translates_lowercase
    lowercase = Translator.new
    assert_equal [["0."]], lowercase.translate_text_to_braille_l1("a")
  end

  #def test_it_translates_uppercase
    #uppercase = Translator.new
    #assert_equal [["..0."]], uppercase.translate_text_to_braille_l1("A")
  #end

  def test_it_translates_special_characters
    special_char = Translator.new
    assert_equal [[".."]], special_char.translate_text_to_braille_l1("!")
  end

  #def test_it_combines_all_three_lines_of_translated_test
    #combine = Translator.new
    #assert_equal "", combine.combine_all_translated_text()
  #end
 
end