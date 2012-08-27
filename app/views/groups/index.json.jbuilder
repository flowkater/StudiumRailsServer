json.groups @groups do |json, group|
	json.(group, :id, :name, :goal, :place)
	json.post_count group.posts.size.to_s
	json.user_count group.users.size.to_s
	if group.pictures.first
		json.image group.pictures.first.image_url(:thumb)
	end
end
