class Todolist < ActiveRecord::Base
	attr_accessible :list

	belongs_to :party
end
