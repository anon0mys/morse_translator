require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'

class TestTranslate < Minitest::Test

  def setup
    @translator = Translate.new
    @translations = {
      "hello world" => "......-...-..--- .-----.-..-..-..",
      "Hello World" => "......-...-..--- .-----.-..-..-..",
      "There are 3 ships" => "-......-.. .-.-.. ...-- ..........--...."
    }
  end

  def test_translator_initializes
    assert_instance_of Translate, @translator
  end

  def test_translator_translates_lowercase_letters
    expected = "......-...-..--- .-----.-..-..-.."
    result = @translator.eng_to_morse("hello world")

    assert_equal expected, result
  end

  def test_translator_translates_uppercase_and_numbers
    @translations.each do |english, morse|
      assert_equal morse, @translator.eng_to_morse(english)
    end
  end

  def test_translator_can_traslate_a_file
    expected = ".. .--- ..-. .- ..-....-..."
    result = @translator.from_file("input.txt")

    assert_equal expected, result
  end

  def test_translator_translates_morse_to_english
    expected = "hello world"
    result = @translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")

    assert_equal expected, result
  end

  def test_translator_can_translate_files_with_multiple_lines
    expected = ".-....-.. .----.-....-.. ..---.-....-.. ...--"
    result = @translator.from_file("input_two.txt")
    
    assert_equal expected, result
  end

end
