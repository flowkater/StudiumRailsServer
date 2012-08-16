json.groups @groups do |json, group|
	json.(group, :id, :name, :introduce)
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