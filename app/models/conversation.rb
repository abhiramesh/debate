class Conversation < ActiveRecord::Base
  attr_accessible :owner_id, :title, :topic_id

  belongs_to :topic
  has_many :comments
  has_many :users, through: :comments

end
