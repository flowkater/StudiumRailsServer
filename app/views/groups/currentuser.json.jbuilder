json.(@user, :id, :name)
json.image @user.avatar.url(:thumb)

json.groups @user.groups do |json, group|
	json.name group.name
	if group.pictures.first
		json.image group.pictures.first.image_url(:thumb)
	end
end