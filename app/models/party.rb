class Party < ActiveRecord::Base
	belongs_to :group
	has_many :todolists, dependent: :destroy

	attr_accessible :body, :date, :starttime, :endtime, :place, :todolists_attributes

	# nested todolsits
	accepts_nested_attributes_for :todolists, allow_destroy: :true
end
