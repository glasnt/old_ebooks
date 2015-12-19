# glasnt ebooks

Based on [Buster Benson's gist](https://gist.github.com/busterbenson/6695350), but with some minor tweaks. 

## General Premise

Using a cache of your [tweets](https://twitter.com/settings/account#tweet_export) and a [Markov chain](https://en.wikipedia.org/wiki/Markov_chain) library written in [Ruby](https://github.com/zolrath/marky_markov), `ebooks.rb` generates a funny thing. 


You can then curate a list of funny things, add them to a new-line delimited file, then setup a job to automatically run `tweet_cache.rb`. 

## Quick setup

Clone this repo, [export your Twitter archive](https://twitter.com/settings/account#tweet_export), save the `tweets.csv` into the code folder, install the dependencies via `bundle install`, then run `bundle exec ruby ebooks.rb`. 

## Full Setup

### Get the input from Twitter

 * [Export your Twitter archive](https://twitter.com/settings/account#tweet_export)

### Get this code

 * `git clone https://github.com/glasnt/ebooks`

### Get ruby and dependencies onto your system

 * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
 * `gem install bundle`
 * `bundle install`

### Seed the Markov Chain

 * Take the `tweets.csv` from the downloaded Twitter archive and save it into the cloned code folder

### Run the code

 * `bundle exec ruby ebooks.rb`

### Optional: Tweet the results

**Warning:** I highly recommend doing this part manually to vet contents. 

 * run `bundle exec ruby ebooks.rb NUM` where NUM is the amount of results you want at once
 * Choose some nicer output, cleaning it up as much as you like, and add to a new-line delimited file. 
 * run `tweet_cache.rb cache.txt` to tweet the first line of the cache, and removing that line from the file. 

You can setup this up as a scheduled task via [crontab](https://help.ubuntu.com/community/CronHowto) with the code `0 */4 * * * /home/glasnt/ebooks/tweet_cache.rb cache.txt` to tweet a result every 4 hours, for example. 

## Licence

See [LICENSE](https://github.com/glasnt/ebooks/blob/master/LICENSE.md)
