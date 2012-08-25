class GroupsController < InheritedResources::Base
	respond_to :html, :json

	def create
		create!{collection_url}
	end

	def new
		@group = Group.new
		@group.pictures.build
		new!
	end


	def partym
		@search = Group.search(params[:q])
		# @groups = @search.result.page params[:page]	
		@groups = @search.result.recently_partym.page params[:page]
	end

	protected

	def collection
		@search = Group.search(params[:q])
		@groups = @search.result.updated_groups.page params[:page]
	end
end
