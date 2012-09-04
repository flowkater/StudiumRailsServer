class Party < ActiveRecord::Base
	belongs_to :group
	has_many :todolists, dependent: :destroy

	accepts_nested_attirubtes_for :todolists
end
