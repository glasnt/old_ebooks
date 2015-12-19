# glasnt ebooks

In the spirit of [horse_ebooks](https://en.wikipedia.org/wiki/Horse_ebooks), based on the code by [Buster Benson](https://gist.github.com/busterbenson/6695350), but with some minor tweaks. 

## General Premise

Using a cache of your [tweets](https://twitter.com/settings/account#tweet_export) and a [Markov chain](https://en.wikipedia.org/wiki/Markov_chain) library written in [Ruby](https://github.com/zolrath/marky_markov), `ebooks.rb` generates a funny thing. 

You can then curate a list of funny things, add them to a new-line delimited file, then setup a job to automatically run `tweet_cache.rb`. 

## Quick setup

Create a new twitter account, e.g. `USERNAME_ebooks`. Clone this repo, [export your Twitter archive](https://twitter.com/settings/account#tweet_export), save the `tweets.csv` into the cloned folder. Install the dependencies via `bundle install`, then run `bundle exec ruby ebooks.rb`. Giggle at the output, and tweet at your leisure. 

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

### Setup a special account for your randomised ramblings

Create a new [Twitter](https://twitter.com) account. I strongly suggest following these recommendations, for reasons below: 

 * Naming recommendations: 
   * append `_ebooks` to your normal screen name
   * the twitter username limit is 15 characters, and since `_ebooks` is 7, you only get 8 characters to play with
 * Set a display name `screenname ebooks`
 * Set the avatar to your normal avatar, but upsite down

Using these settings means your account is easily identifable as a robot account, and can be inferred to belong to you. 


### Optional: Automatically tweet things

**Warning:** I highly recommend **not** piping output of this application directly to Twitter. You have no idea what's going to come out of this robot's mouth. Think a foul-mouthed R2D2, without the bleeping (or maybe that's just me...)

 * Obtain your API secrets and keys from [Twitter](https://apps.twitter.com/). You'll need a `CONSUMER_KEY`/`SECRET` pair and a `ACCESS_TOKEN`/`SECRET` pair. 
 * run `bundle exec ruby ebooks.rb NUM` where NUM is the amount of results you want at once
 * Choose some nicer output, cleaning it up as much as you like, and add to a new-line delimited file. 
 * run `tweet_cache.rb cache.txt` to tweet the first line of the cache, and removing that line from the file. 
 * run this as a scheduled task via [crontab](https://help.ubuntu.com/community/CronHowto) using `0 */4 * * * /home/glasnt/ebooks/tweet_cache.rb cache.txt` to tweet a result every 4 hours, for example. 


**Recommendation**: Try not to tweet more regularly than once an hour. There are Twitter API limitations that mean that you can't just spam things willy-nilly, plus, you really don't want to annoy people with your new robot. If your regular account retweets all your robots noise, you might not be very popular. 

## Licence

See [LICENSE](https://github.com/glasnt/ebooks/blob/master/LICENSE.md)
