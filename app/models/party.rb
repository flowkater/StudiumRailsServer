class Party < ActiveRecord::Base
	belongs_to :group
	default_scope order: 'date'
	has_many :todolists, dependent: :destroy

	attr_accessible :body, :date, :time, :place, :todolists_attributes
	
	# nested todolsits
	accepts_nested_attributes_for :todolists, allow_destroy: :true
end
