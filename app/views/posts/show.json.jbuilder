# json.posts @post do |json, post|
	# json.(post, :id, :body, :posttype)
# end

json.(@post, :id, :body, :posttype)

json.comments @post.comments do |json, comment|
	json.comment_user comment.user.email
end