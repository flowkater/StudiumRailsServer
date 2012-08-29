class GroupsController < InheritedResources::Base
	respond_to :html, :json
	# before_filter :authenticate_user!

	def create
		@group = current_user.groups.create!(params[:group])
		@group.memberships.first.create!
		create!{collection_url}
	end

	def new
		@group = current_user.groups.build
		@group.pictures.build
		new!
	end

	def partym
		@search = Group.search(params[:q])
		# @groups = @search.result.page params[:page]	
		@groups = @search.result.recruit.recently_partym.page params[:page]
	end

	protected

	def collection
		@search = Group.search(params[:q])
		@groups = @search.result.updated_groups.page params[:page]
	end

	def begin_of_association_chain
		current_user
	end
end
