class PostsController < InheritedResources::Base
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

	protected

	def begin_of_association_chain
		current_user
	end
end
