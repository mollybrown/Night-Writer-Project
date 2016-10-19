require 'minitest/autorun'
require 'minitest/pride'

require '../lib/translator.rb'

class TranslatorTest < Minitest::Test
 def test_it_exists
   assert TranslatorTest
 end

 def test_it_translates_l1_to_braille
   line_1 = Translator.new
   assert_equal "0.0.00", line_1.translate_text_to_braille_l1("abc")
 end
 
end