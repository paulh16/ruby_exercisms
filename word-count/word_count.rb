class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = sanitize_input(phrase)
  end

  def word_count
    words = phrase.split(' ')
    add_words_to_counter(words)
  end

  private

  def sanitize_input(phrase)
    phrase.downcase.gsub(/\s\s|,/, " ").gsub(/[^\w\s']/, "")
  end

  def add_words_to_counter(words)
    words.each_with_object({}) do |word, library|
      if library[word]
        library[word] += 1
      else
        library[word] = 1
      end
    end
  end
end
