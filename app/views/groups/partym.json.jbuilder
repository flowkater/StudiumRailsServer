json.partymessages @groups do |json, group|
	if group.partymessages.count > 0
		json.id group.id
		json.name group.name
		json.goal group.goal
		json.place group.place
		json.body group.partymessages.first.body
		json.recruit group.recruit
		json.time group.partymessages.first.updated_at.strftime("%m/%d %p %I:%M")
		json.role group.role(current_user)
		if group.pictures.first
			json.image group.pictures.first.image_url(:thumb)
		end
	else
		json.body ""
	end
end
