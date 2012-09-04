json.(@user, :id, :name)
json.image @user.avatar.url(:thumb)

json.groups @user.groups do |json, group|
	json.id group.id
	json.name group.name
	json.role group.role(current_user)
	if group.pictures.first
		json.image group.pictures.first.image_url(:thumb)
	end
end