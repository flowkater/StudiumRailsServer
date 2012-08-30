# json.posts @post do |json, post|
	# json.(post, :id, :body, :posttype)
# end

json.(@post, :id, :body, :posttype)
json.name @post.user.name
json.created_at @post.created_at
if @post.user.avatar
	json.image @post.user.avatar.url(:thumb)
end

json.comments @comments do |json, comment|
	json.name comment.user.name
	json.body comment.body
	json.time comment.updated_at
	if comment.user.avatar
		json.image comment.user.avatar.url(:thumb)
	end
end