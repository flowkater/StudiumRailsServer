class Post < ActiveRecord::Base
  belongs_to :group
  default_scope order: 'updated_at DESC'
  has_many :comments
  has_many :pictures, as: :imageable, dependent: :destroy

  # attr_accessible :body, :posttype, :pictures

  # nested picture
  accepts_nested_attributes_for :pictures
end
