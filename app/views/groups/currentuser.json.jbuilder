json.(@user, :id, :name)
json.image @user.avatar.url(:thumb)

json.groups @user.groups do |json, group|
	unless group.role_is?(current_user, "waiting")
		json.id group.id
		json.name group.name
		json.role group.role(current_user)
		if group.pictures.first
			json.image group.pictures.first.image_url(:thumb)
		else
			json.image ""
		end
	end
end