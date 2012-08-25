class Group < ActiveRecord::Base
	paginates_per 5
	scope :updated_groups,order: 'updated_at DESC'
	scope :recently_partym, joins: :partymessages,group: 'group_id', order: 'partymessages.updated_at DESC'

	# model association
	has_many :partymessages
	has_many :parties
	has_many :posts
	has_many :comments, through: :posts
	has_many :pictures, as: :imageable, dependent: :destroy

	# nested picture
	accepts_nested_attributes_for :pictures
end