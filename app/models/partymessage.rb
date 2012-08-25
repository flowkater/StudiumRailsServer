class Partymessage < ActiveRecord::Base
	# paginates_per 5
	default_scope order: 'updated_at DESC'
  belongs_to :group
end
