class Article < ActiveRecord::Base
  attr_accessible :description, :title, :topic_id, :url

  belongs_to :topic
  
end
