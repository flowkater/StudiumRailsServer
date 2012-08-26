json.groups @groups do |json, group|
	json.(group, :id, :name, :goal, :place)
	json.post_count group.posts.size.to_s
	json.user_count group.users.size.to_s
	json.image_url group.pictures do |json, image|
		json.image group.pictures.first.image_url(:thumb)
	end
end


# json.stores @stores do |json, store|
# 	json.(store, :id, :name, :introduce, :address )
# 	json.store_image store.image_url
# 	# json.post store.posts.last.content

# 	if store.posts.count > 0
# 		json.post store.posts.first.content
# 		json.post_image store.posts.first.post_image_url
# 	else
# 		json.post ""
# 		# json.post do |json|
# 			# json.content ""	
# 		# end
# 	end
# end