class Topic < ActiveRecord::Base
  attr_accessible :description, :tag, :title, :url, :user_id

  belongs_to :user
  has_many :conversations
  has_many :articles

  require 'nokogiri'
  require 'open-uri'

  def get_topics
	
	page = Nokogiri::HTML(open("https://news.google.com"))

	topics_array = []

	if page
		page.xpath("//div[@class='blended-wrapper blended-wrapper-first esc-wrapper']").each do |d|
			d.xpath("//div[@class='esc-extension-wrapper']/div[@class='moreLinks']/a[@class='more-coverage-text']").each do |c|
				link = c['href']
				if link && topics_array.count < 15
						begin 
						page2 = Nokogiri::HTML(open("https://news.google.com#{link}"))
						rescue
						end
					if page2
						puts topic_title = page2.xpath("//div[contains(@class, 'headline-story')]/h2[@class='title']")[0].text
						if topic_title
							unless Topic.where(:title => topic_title).first
								new_topic = Topic.create(:title => topic_title, :url => "https://news.google.com#{link}")
								if new_topic.save
									topics_array << new_topic.id
									page2.xpath("//div[contains(@class, 'headline-story')]").each do |a|
										article_description = a.css('div.snippet').text
										article_title = a.css('h2.title').text
										article_link = a.css('a.article')[0]["href"]
										if article_title && article_link
											unless Article.where(:url => article_link).first
												Article.create(:description => article_description, :title => article_title, :topic_id => new_topic.id, :url => article_link)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	Topic.last.delay(:run_at => 3.hours.from_now ).get_topics
  end

end
