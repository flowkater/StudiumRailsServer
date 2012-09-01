class MembershipsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	def create
		@group = Group.find(params[:membership][:group_id])
		current_user.join!(@group)
		redirect_to @group
	end

	def destroy
		@group = Membership.find(params[:id]).group
		current_user.leave!(@group.id)
		redirect_to @group
	end
end