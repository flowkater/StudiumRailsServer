class Comment < ActiveRecord::Base
	paginates_per 10
  belongs_to :post
  belongs_to :user
end
