require 'rubygems'
require 'thread'
require 'csv'
require 'marky_markov'

PATH_TO_TWEETS_CSV   = 'tweets.csv'
PATH_TO_TWEETS_CLEAN = 'markov_dict.txt'

csv_text = CSV.parse(File.read(PATH_TO_TWEETS_CSV))

# Generate Seed Input
File.open(PATH_TO_TWEETS_CLEAN, 'w') do |file|
  csv_text.reverse.each do |row|
    # Strip links and new lines
    tweet_text = row[5].gsub(/(?:f|ht)tps?:\/[^\s]+/, '').gsub(/\n/,' ').gsub(/\@[\w]*/,'')
    # Save the text
    file.write("#{tweet_text}\n")
  end
end
  
markov = MarkyMarkov::Dictionary.new('dictionary')
markov.parse_file PATH_TO_TWEETS_CLEAN
tweet_text = markov.generate_n_sentences(2).split(/\#\</).first.chomp.chop
markov.save_dictionary!

# Output tweet for later processing
puts tweet_text
