class MembershipsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	def create
		@group = Group.find(params[:membership][:group_id])
		current_user.join!(@group)
		redirect_to @group
	end

	def accept
		@user = User.find(params[:membership][:user_id])
		@group = Group.find(params[:membership][:group_id])
		@membership = @user.member?(@group)
		@membership.accept!
		redirect_to status: 200		
	end

	def destroy
		@group = Membership.find(params[:id]).group
		current_user.leave!(@group.id)
		redirect_to @group
	end

end