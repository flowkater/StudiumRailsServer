json.(@group, :id, :name, :created_at, :subject, :goal)
if @group.pictures.first
	json.image @group.pictures.first.image_url(:thumb)
end
json.users @group.users do |json, user|
	unless @group.role_is?(user,"waiting")
		if user.avatar
			json.image user.avatar.url(:thumb)
		end
		json.name user.name
	else
		json.name ""
	end
end

# json.(@store, :id, :name, :address, :introduce)
# json.posts @store.posts do |json, post|

# 	json.(post, :content, :updated_at)	
# 	json.comments post.comments, :content, :updated_at
# end

# json.posts @store.posts, :id, :content
