require 'pry'

class Translate
  attr_reader :dictionary

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end

  def eng_to_morse(eng_string)
    translated_string = eng_string.downcase.split("").map do |character|
      @dictionary[character]
    end
    translated_string.join
  end

  def from_file(filename)
    if File.exist?("./lib/#{filename}")
      file = File.open("./lib/#{filename}", 'r')
      file.lines.each do |line|
        return eng_to_morse(line)
      end
    else
      "Please enter a valid filename"
    end
  end

  def morse_to_eng(morse_string)
    words_array = morse_string.split("  ")
    translated = words_array.map do |word|
      translate_word(word).join
    end
    translated.join(" ")
  end

  def translate_word(word)
    word.split.map do |character|
      @dictionary.key(character)
    end
  end

end
