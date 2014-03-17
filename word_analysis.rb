class WordAnalysis
  def initialize(string)
    @string = string
  end

  def word_count
    word_array = @string.split(' ')
    word_freq = {}
    word_array.each do |word|
      if word_freq[word.downcase]
        word_freq[word.downcase] += 1
      else
        word_freq[word.downcase] = 1
      end
    end
    word_freq
  end

  def letter_count
    char_array = @string.split('')
    char_freq = {}
    char_array.each do |char|
      if /[a-zA-Z]/.match(char)
        if char_freq[char.downcase]
          char_freq[char.downcase] += 1
        else
          char_freq[char.downcase] = 1
        end
      end
    end
    char_freq
  end

  def symbol_count
    char_array = @string.split('')
    char_freq = {}
    char_array.each do |char|
      if /[^a-zA-Z]/.match(char)
        if char_freq[char]
          char_freq[char] += 1
        else
          char_freq[char] = 1
        end
      end
    end
    char_freq
  end

  def top_words
    hash = self.word_count
    hash.sort_by{|key, value| -value}[0..2]
  end

  def top_letters
    hash = self.letter_count
    hash.sort_by{|key, value| -value}[0..2]
  end
end
