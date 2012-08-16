class Post < ActiveRecord::Base
  belongs_to :group
  has_many :comments

  attr_accessible :body, :type
end
