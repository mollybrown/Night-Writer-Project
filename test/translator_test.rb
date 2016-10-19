require 'minitest/autorun'
require 'minitest/pride'

require './test/night_writer.rb'
require './test/translator.rb'

class TranslatorTest < Minitest::Test
  def test_it_exists
    assert TranslatorTest
  end

  def test_it_imports_contents_string
  	skip
    translator = Translator.new
    contents = @@contents
    assert_kind_of String, contents
  end

  def test_it_puts_zero_index_of_key_for_contents
  	translator = Translator.new
  	braille = translator.translate_text_to_braille
  	assert kind_of String, braille
  end
  
end