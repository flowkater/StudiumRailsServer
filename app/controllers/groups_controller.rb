class GroupsController < InheritedResources::Base
	respond_to :html, :json
	def index
		@search = Group.search(params[:q])
		@groups = @search.result
	end
end
