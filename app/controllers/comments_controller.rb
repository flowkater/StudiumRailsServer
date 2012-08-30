class CommentsController < InheritedResources::Base
	respond_to :html, :json
	belongs_to :post
	action :all
	def create
		@comment = current_user.comments.build(params[:comment])
		@comment.post_id = params[:post_id]
		create!{ collection_url }
	end

	protected

	def collection
		@comments ||= end_of_association_chain.page params[:page]
	end

	def begin_of_association_chain
		current_user
	end
end
