json.(@group, :id, :name, :created_at, :subject, :goal)

json.users @group.users do |json, user|
	json.member_name user.email
end

# json.(@store, :id, :name, :address, :introduce)
# json.posts @store.posts do |json, post|

# 	json.(post, :content, :updated_at)	
# 	json.comments post.comments, :content, :updated_at
# end

# json.posts @store.posts, :id, :content
