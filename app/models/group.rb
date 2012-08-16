class Group < ActiveRecord::Base
	has_many :partymessages
	has_many :parties
	has_many :posts
	has_many :comments, through: :posts
end
