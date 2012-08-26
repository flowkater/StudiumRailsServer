class Group < ActiveRecord::Base
	paginates_per 5
	scope :updated_groups,order: 'updated_at DESC'
	scope :recently_partym,joins: :partymessages,group: 'group_id', order: 'partymessages.updated_at DESC'
	scope :recruit, where(recruit: true)

	# model association
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	has_many :partymessages
	has_many :parties
	has_many :posts
	has_many :pictures, as: :imageable, dependent: :destroy

	# Use pure AR
	has_many :founders, class_name: 'User', conditions:['memberships.role=?','founder'],
	 through: :memberships, foreign_key: 'user_id', source: :user
	has_many :members, class_name: 'User', conditions:['memberships.role=?','member'],
	 through: :memberships, foreign_key: 'user_id', source: :user
	has_many :waiting_users, class_name: 'User', conditions:['memberships.role=?','waiting'],
	 through: :memberships, foreign_key: 'user_id', source: :user

	def membership_of(user)
		memberships.find(:first, conditions:{user_id: user.id})
	end

	def role_is?(user,str)
		(membership_of(user).current_state.to_s == str) rescue false
	end

	# nested picture
	accepts_nested_attributes_for :pictures
end