require 'mechanize'
require 'json'

a = Mechanize.new

a.get('http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml')

puts a.page.parser.css('body')