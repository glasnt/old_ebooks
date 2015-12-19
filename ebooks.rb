require 'csv'
require 'marky_markov'

PATH_TO_TWEETS_CSV   = 'tweets.csv'
PATH_TO_TWEETS_CLEAN = 'markov_dict.txt'

iterations = (ARGV[0] || 1).to_i

csv_text = CSV.parse(File.read(PATH_TO_TWEETS_CSV))

# Some very basic cleanup of content, with only passing regard for the English language
def cleanup tweet
  tweet
    .gsub(/(?:f|ht)tps?:\/[^\s]+/, '')   # remove links
    .gsub(/\n/,' ')                      # remove new lines
    .gsub(/\@[\w]*/,"")                  # remove @-mentions
    .gsub(/\#[\w]+/,"")                  # remove hashtags
    .gsub("RT",'')                       # remove old-style tweets
    .gsub(/[\s]+/, " ")                  # remove duplicate spaces
    .gsub(/^([\s]+)/, "")                # remove leading space
end

# Cleanup generated content 
def punct tweet
  tweet += "." unless tweet[-1] == "."   # end tweet in a full stop
  tweet.capitalize!                      # capitalize

  [":", "!", ","].each do |x|            # rudimentary punctuation cleanup
    tweet.gsub!(/\s#{x}[\s]+([\w])/) { |m| "#{x} #{m[-1].capitalize!}"}
  end

  tweet.match(/^.{0,140}\b/)[0]
end

# Generate Seed Input
File.open(PATH_TO_TWEETS_CLEAN, 'w') do |file|
  csv_text.reverse.each do |row|
    tweet_text = cleanup(row[5])
    file.write("#{tweet_text}\n")
  end
end

# Marky Markov, here with the master plan
markov = MarkyMarkov::Dictionary.new('dictionary')
markov.parse_file PATH_TO_TWEETS_CLEAN

iterations.times do
  puts punct markov.generate_n_sentences(2)
end

markov.save_dictionary!
