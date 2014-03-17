require 'rspec'
require 'pry'
require_relative 'word_analysis.rb'

test_input = 'Lorem Ipsum The test string is a test string for testing! an object '
word_array = test_input.split(' ')
word_freq = {}
word_array.each do |word|
  if word_freq[word.downcase]
    word_freq[word.downcase] += 1
  else
    word_freq[word.downcase] = 1
  end
end

char_array = test_input.split('')
alpha_freq = {}
symbol_freq = {}
char_array.each do |char|
  if /[a-zA-Z]/.match(char)
    if alpha_freq[char.downcase]
      alpha_freq[char.downcase] += 1
    else
      alpha_freq[char.downcase] = 1
    end
  else
    if symbol_freq[char]
      symbol_freq[char] += 1
    else
      symbol_freq[char] = 1
    end
  end
end

top_3_words = word_freq.sort_by{|key, value| -value}[0..2]
top_3_letters = alpha_freq.sort_by{|key, value| -value}[0..2]

=begin
  Edge cases that should be checked.
  Words ending in puncuation
  case sensitivity
  blocks of symbols
  empty strings
  symbol only string
=end
describe WordAnalysis do
  wa_object = WordAnalysis.new(test_input)

  it 'takes a string as an input' do
    expect wa_object.class.should eq(WordAnalysis)
  end

  it 'returns a count for each word occurrence' do
    expect wa_object.word_count.should eq(word_freq)
  end

  it 'returns a count for each letter occurrence' do
    expect wa_object.letter_count.should eq(alpha_freq)
  end

  it 'returns a count for each symbol occurrence' do
    expect wa_object.symbol_count.should eq(symbol_freq)
  end

  it 'returns the 3 most common words' do
    expect wa_object.top_words.should eq(top_3_words)
  end

  it 'returns the 3 most common letters' do
    expect wa_object.top_letters.should eq(top_3_letters)
  end
end
