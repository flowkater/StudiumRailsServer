json.(@group, :id, :name, :created_at, :subject, :goal)
if @group.pictures.first
	json.image @group.pictures.first.image_url(:thumb)
end
json.users @group.users do |json, user|
	if user.avatar
		json.image user.avatar.url(:thumb)
	end
	json.name user.name
	json.role user.role(@group)
end
