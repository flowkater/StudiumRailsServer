class CommentsController < InheritedResources::Base
	respond_to :html, :json
	belongs_to :post
	action :all
	def create
		@comment = current_user.comments.build(params[:comment])
		create!{ collection_url }
	end
end
