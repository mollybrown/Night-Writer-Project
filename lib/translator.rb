require 'pry'
#require './conversion_dictionary.rb'

class Translator       

  def initialize
    #@dictionary = ConversionDictionary.new.dict
    @braille_line_1 = []
    @braille_line_2 = []
    @braille_line_3 = []
    @l1_braille = []
    @l2_braille = []
    @l3_braille = []
    @char_key_l1 = { 
    # "A" => ["..0."],
    # "B" => ["..0."],
    # "C" => ["..00"],
    # "D" => ["..0."],
    # "E" => ["..0."],
    # "F" => ["..00"],
    # "G" => ["..00"],
    # "H" => ["..0."],
    # "I" => ["...0"],
    # "J" => ["...0"],
    # "K" => ["..0."],
    # "L" => ["..0."],
    # "M" => ["..00"],
    # "N" => ["..00"],
    # "O" => ["..0."],
    # "P" => ["..00"],
    # "Q" => ["..00"],
    # "R" => ["..0."],
    # "S" => ["...0"],
    # "T" => ["...0"],
    # "U" => ["..0."],
    # "V" => ["..0."],
    # "W" => ["...0"],
    # "X" => ["..00"],
    # "Y" => ["..00"],
    # "Z" => ["..0."],
    "a" => ["0."], 
    "b" => ["0."],
    "c" => ["00"],
    "d" => ["00"],
    "e" => ["0."],
    "f" => ["00"],
    "g" => ["00"],
    "h" => ["0."],
    "i" => [".0"],
    "j" => [".0"],
    "k" => ["0."],
    "l" => ["0."],
    "m" => ["00"],
    "n" => ["00"],
    "o" => ["0."], 
    "p" => ["00"],
    "q" => ["00"],
    "r" => ["0."],
    "s" => [".0"],
    "t" => [".0"],
    "u" => ["0."],
    "v" => ["0."],
    "w" => [".0"],
    "x" => ["00"],
    "y" => ["00"],
    "z" => ["0."],
    "!" => [".."],
    "'" => [".."],
    "," => [".."],
    "-" => [".."],
    "." => [".."],
    "?" => [".."],
    " " => ["  "]
  }

  @char_key_l2 = { 
    # "A" => ["...."],
    # "B" => ["..0."],
    # "C" => ["...."],
    # "D" => ["...0"],
    # "E" => ["...0"],
    # "F" => ["..0."],
    # "G" => ["..00"],
    # "H" => ["..00"],
    # "I" => ["..0."],
    # "J" => ["..00"],
    # "K" => ["...."],
    # "L" => ["..0."],
    # "M" => ["...."],
    # "N" => ["...0"],
    # "O" => ["...0"],
    # "P" => ["..0."],
    # "Q" => ["..00"],
    # "R" => ["..00"],
    # "S" => ["..0."],
    # "T" => ["..00"],
    # "U" => ["...."],
    # "V" => ["..0."],
    # "W" => ["..00"],
    # "X" => ["...."],
    # "Y" => ["...0"],
    # "Z" => ["...0"],
    "a" => [".."], 
    "b" => ["0."],
    "c" => [".."],
    "d" => [".0"],
    "e" => [".0"],
    "f" => ["0."],
    "g" => ["00"],
    "h" => ["00"],
    "i" => ["0."],
    "j" => ["00"],
    "k" => [".."],
    "l" => ["0."],
    "m" => [".."],
    "n" => [".0"],
    "o" => [".0"],
    "p" => ["0."],
    "q" => ["00"],
    "r" => ["00"],
    "s" => ["0."],
    "t" => ["00"],
    "u" => [".."],
    "v" => ["0."],
    "w" => ["00"],
    "x" => [".."],
    "y" => [".0"],
    "z" => [".0"],
    "!" => ["00"],
    "'" => [".."],
    "," => ["0."],
    "-" => [".."],
    "." => ["00"],
    "?" => ["0."],
    " " => ["  "],
  }

  @char_key_l3 = {
    # "A" => [".0.."],
    # "B" => [".0.."],
    # "C" => [".0.."],
    # "D" => [".0.."],
    # "E" => [".0.."],
    # "F" => [".0.."],
    # "G" => [".0.."],
    # "H" => [".0.."],
    # "I" => [".0.."],
    # "J" => [".0.."],
    # "K" => [".00."],
    # "L" => [".00."],
    # "M" => [".00."],
    # "N" => [".00."],
    # "O" => [".00."],
    # "P" => [".00."],
    # "Q" => [".00."],
    # "R" => [".00."],
    # "S" => [".00."],
    # "T" => [".00."],
    # "U" => [".000"],
    # "V" => [".000"],
    # "W" => [".0.0"],
    # "X" => [".000"],
    # "Y" => [".000"],
    # "Z" => [".000"], 
    "a" => [".."], 
    "b" => [".."],
    "c" => [".."],
    "d" => [".."],
    "e" => [".."],
    "f" => [".."],
    "g" => [".."],
    "h" => [".."],
    "i" => [".."],
    "j" => [".."],
    "k" => ["0."],
    "l" => ["0."],
    "m" => ["0."],
    "n" => ["0."],
    "o" => ["0."],
    "p" => ["0."],
    "q" => ["0."],
    "r" => ["0."],
    "s" => ["0."],
    "t" => ["0."],
    "u" => ["00"],
    "v" => ["00"],
    "w" => [".0"],
    "x" => ["00"],
    "y" => ["00"],
    "z" => ["00"],
    "!" => ["0."],
    "'" => ["0."],
    "," => [".."],
    "-" => ["00"],
    "." => [".0"],
    "?" => ["00"],
    " " => ["  "],
  }

  @braille_key = {
      # ["..0.", "....", ".0.."] => "A",
      # ["..0.", "..0.", ".0.."] => "B",
      # ["..00", "....", ".0.."] => "C",
      # ["..0.", "...0", ".0.."] => "D",
      # ["..0.", "...0", ".0.."] => "E",
      # ["..00", "..0.", ".0.."] => "F",
      # ["..00", "..00", ".0.."] => "G",
      # ["..0.", "..00", ".0.."] => "H",
      # ["...0", "..0.", ".0.."] => "I",
      # ["...0", "..00", ".0.."] => "J",
      # ["..0.", "....", ".00."] => "K",
      # ["..0.", "..0.", ".00."] => "L",
      # ["..00", "....", ".00."] => "M",
      # ["..00", "...0", ".00."] => "N",
      # ["..0.", "...0", ".00."] => "O",
      # ["..00", "..0.", ".00."] => "P",
      # ["..00", "..00", ".00."] => "Q",
      # ["..0.", "..00", ".00."] => "R",
      # ["...0", "..0.", ".00."] => "S",
      # ["...0", "..00", ".00."] => "T",
      # ["..0.", "....", ".000"] => "U",
      # ["..0.", "..0.", ".000"] => "V",
      # ["...0", "..00", ".0.0"] => "W",
      # ["..00", "....", ".000"] => "X",
      # ["..00", "...0", ".000"] => "Y",
      # ["..0.", "...0", ".000"] => "Z",
      ["0.", "..", ".."] => "a",
      ["0.", "0.", ".."] => "b",
      ["00", "..", ".."] => "c",
      ["00", ".0", ".."] => "d",
      ["0.", ".0", ".."] => "e",
      ["00", "0.", ".."] => "f",
      ["00", "00", ".."] => "g",
      ["0.", "00", ".."] => "h",
      [".0", "0.", ".."] => "i",
      [".0", "00", ".."] => "j",
      ["0.", "..", "0."] => "k",
      ["0.", "0.", "0."] => "l",
      ["00", "..", "0."] => "m",
      ["00", ".0", "0."] => "n",
      ["0.", ".0", "0."] => "o",
      ["00", "0.", "0."] => "p",
      ["00", "00", "0."] => "q",
      ["0.", "00", "0."] => "r",
      [".0", "0.", "0."] => "s",
      [".0", "00", "0."] => "t",
      ["0.", "..", "00"] => "u",
      ["0.", "0.", "00"] => "v",
      [".0", "00", ".0"] => "w",
      ["00", "..", "00"] => "x",
      ["00", ".0", "00"] => "y",
      ["0.", ".0", "00"] => "z",
      ["..", "00", "0."] => "!",
      ["..", "..", "0."] => "'",
      ["..", "0.", ".."] => ",",
      ["..", "..", "00"] => "-",
      ["..", "00", ".0"] => ".",
      ["..", "0.", "00"] => "?",
      ["  ", "  ", "  "] => " ",
    }

  end                   

  def translate_text_to_braille_l1(incoming_text)
    incoming_text.chomp.each_char do |i|
      @l1_transform = @char_key_l1.fetch(i)
      @braille_line_1 << @l1_transform
    end
    @braille_line_1 
  end

  def translate_text_to_braille_l2(incoming_text)
    incoming_text.chomp.each_char do |i|
      @l2_transform = @char_key_l2.fetch(i)
      @braille_line_2 << @l2_transform
    end
    @braille_line_2
  end

  def translate_text_to_braille_l3(incoming_text)
    incoming_text.chomp.each_char do |i|
      @l3_transform = @char_key_l3.fetch(i)
      @braille_line_3 << @l3_transform
    end
    @braille_line_3
  end

  def combine_all_translated_text
    @translated_text = @braille_line_1.join + ("\n") + @braille_line_2.join + ("\n") + @braille_line_3.join
  end

  def format_braille(incoming_braille)
    braille_array = incoming_braille.split("\n")
  
    @l1_braille << braille_array[0]
    @braille_scan_0 = @l1_braille.to_s.scan(/.{1,2}/)
    @braille_scan_0.shift

    @l2_braille << braille_array[1]
    @braille_scan_1 = @l2_braille.to_s.scan(/.{1,2}/)
    @braille_scan_1.shift

    @l3_braille << braille_array[2]
    @braille_scan_2 = @l3_braille.to_s.scan(/.{1,2}/)
    @braille_scan_2.shift
  end    

  def combine_braille_lines_for_output
    @braille_pattern = [@braille_scan_0, @braille_scan_1, @braille_scan_2].transpose
    @braille_pattern.pop

    @braille_text = []

    @braille_pattern.map do |element|
        @braille_transform = @braille_key.fetch(element)
        @braille_text << @braille_transform
    end
    @braille_text.join
  end        
  
end




