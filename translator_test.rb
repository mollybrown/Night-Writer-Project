require 'minitest/autorun'
require 'minitest/pride'

require './night_writer.rb'
require './translator.rb'

class TranslatorTest < Minitest::Test
  def test_it_exists
    assert TranslatorTest
  end

  def test_it_imports_string_from_english_txt
    translator = Translator.new
    translator.import_english_txt_string
    assert_kind_of String, raw_english
  end

end