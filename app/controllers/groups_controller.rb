class GroupsController < InheritedResources::Base
	skip_before_filter :verify_authenticity_token
	respond_to :html, :json
	before_filter :authenticate_user!

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

	def founder
		@group = Group.find(params[:id])
		@waiting_users = @group.waiting_users
	end

	def currentuser
		@user = current_user	
	end

	protected

	def collection
		@search = Group.search(params[:q])
		@groups = @search.result.updated_groups.page params[:page]
	end
end
