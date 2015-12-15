# glasnt ebooks

Based on [Buster Benson's gist](https://gist.github.com/busterbenson/6695350), but with some minor tweaks. 

This does not automatically tweet things. 

## TLDR

 * Clone this repo
 * [Export your Twitter archive](https://twitter.com/settings/account#tweet_export)
 * Save the `tweets.csv` file into this repo (it's `.gitignore`'d, don't worry. 
 * `bundle install`
 * `bundle exec ruby ebooks.rb`
 * Use the generated thing as required, e.g. piping to a tweeting mechanism, etc. 

## Todo

 * Do something with [t](https://github.com/sferik/t) to create a cronjob that will run and tweet on a schedule
 * Fork processing out and have it optional if it doesn't already exist
