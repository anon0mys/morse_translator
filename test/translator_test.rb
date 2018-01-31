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
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse("hello world")
  end

  def test_translator_translates_uppercase_and_numbers
    @translations.each do |english, morse|
      assert_equal morse, @translator.eng_to_morse(english)
    end
  end

  def test_translator_can_traslate_a_file
    assert_equal ".. .--- ..-. .- ..-....-...", @translator.from_file("input.txt")
  end

  def test_translator_translates_morse_to_english
    assert_equal "hello world", @translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
  end

end
