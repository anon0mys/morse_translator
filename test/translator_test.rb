require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'

class TestTranslate < Minitest::Test

  def setup
    @translator = Translate.new
    @phrases = [
      "hello world",
      "Hello World",
      "There are 3 ships",
    ]
  end

  def test_translator_initializes
    assert_instance_of Translate, @translator
  end

  def test_translator_translates_lowercase_letters
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse(@phrases[0])
  end


end
