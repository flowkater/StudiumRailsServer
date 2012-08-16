class CommentsController < InheritedResources::Base
	respond_to :html, :json
	belongs_to :group do
		belongs_to :post
	end
	action :all
	def create
		create!{ collection_url }
	end
end
