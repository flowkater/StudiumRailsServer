class Post < ActiveRecord::Base
	paginates_per 5
  belongs_to :group
  belongs_to :user
  default_scope order: 'updated_at DESC'
  has_many :comments
  has_many :pictures, as: :imageable, dependent: :destroy

  attr_accessible :body, :posttype, :pictures_attributes

  # nested picture
  accepts_nested_attributes_for :pictures
end
