class PostsController < InheritedResources::Base
	respond_to :html,:json
	belongs_to :group
	action :all

	def create
		create!{ collection_url }
	end
end
