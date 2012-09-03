class Party < ActiveRecord::Base
	belongs_to :group
	has_many :parties
end
