class PostsController < InheritedResources::Base
	skip_before_filter :verify_authenticity_token
	respond_to :html,:json
	belongs_to :group
	action :all

	def create
		@post = current_user.posts.build(params[:post])
		@post.group_id = params[:group_id]
		create!{ collection_url }
	end

	def new
		@post = Post.new
		@post.pictures.build
		new!
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.page params[:page]
	end


	protected

	def collection
		@posts ||= end_of_association_chain.page params[:page]
	end

end
