json.(@group, :name, :goal)

json.posts @posts do |json, post|
	json.(post, :id,:body, :posttype)
	json.time post.updated_at.strftime("%m/%d %p %I:%M")
	json.name post.user.email
	json.comment_count post.comments.size.to_s
	if post.pictures.first
		json.content_image post.pictures.first.image_url(:thumb)
	end
	if post.user.avatar.url
		json.member_image post.user.avatar.url(:thumb)
	end
	# json.picture post.pictures do |json, picture|
		# 	json.image_url picture.image_url(:thumb)
	# end
end