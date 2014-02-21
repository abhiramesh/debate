web: bundle exec rails server -p $PORT
worker:  bundle exec rake jobs:work
collector: bundle exec rails runner script/get_topics.rb