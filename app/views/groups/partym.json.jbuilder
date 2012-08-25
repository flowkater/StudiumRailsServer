json.partymessages @groups do |json, group|
	if group.partymessages.count > 0
		json.body group.partymessages.first.body
		json.group_image group.pictures.first
		json.time group.partymessages.first.updated_at.strftime("%m/%d %p %I:%M")
	else
		json.body ""
	end
end
