class PartymessagesController < InheritedResources::Base
	respond_to :html, :json
	belongs_to :group
	actions :all

	def create
		create!{ collection_url }
	end
end
